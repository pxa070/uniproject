const { authMiddleware } = require('../../middleware/auth');
const httpMocks = require('node-mocks-http');
const jwt = require('jsonwebtoken');

describe('Authentication Middleware Tests', () => {
    it('should return 401 if no Authorization header is present', () => {
        const req = httpMocks.createRequest({
            method: 'GET',
            url: '/protected-route'
        });
        const res = httpMocks.createResponse();
        const next = jest.fn();

        authMiddleware(req, res, next);
        expect(res.statusCode).toBe(401);
        expect(JSON.parse(res._getData())).toEqual({ message: 'Authentication required' });
    });

    it('should call next() for valid token', () => {
        const req = httpMocks.createRequest({
            method: 'GET',
            url: '/protected-route',
            headers: {
                Authorization: 'Bearer valid.token.here'
            }
        });
        const res = httpMocks.createResponse();
        const next = jest.fn();

        // Mock jwt.verify to always return true or valid decoded details
        jest.spyOn(jwt, 'verify').mockReturnValue({ userId: '123', role: 'user' });

        authMiddleware(req, res, next);
        expect(next).toHaveBeenCalled();
    });
});