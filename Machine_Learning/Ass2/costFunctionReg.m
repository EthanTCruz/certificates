function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


function g = sigmoid(z)
    g = 1.0 ./ (1.0 + exp(-z));
end

function h = hypothesis(theta, x)
    h = sigmoid(x * theta);
end


% Cost function calculation
J = (1/m)*sum(-y .* log(hypothesis(theta,X)) - (1-y).*log(1-hypothesis(theta,X))) + ...
    (lambda/(2*m))*sum(theta(2:end).^2); % Regularize from theta(2) onwards

% Gradient calculation
grad(1) = (1/m)*sum((hypothesis(theta,X) - y).*X(:,1)); % Gradient for theta(1) (bias term)

for j = 2:length(theta)
    grad(j) = (1/m)*sum((hypothesis(theta,X) - y).*X(:,j)) + (lambda/m)*theta(j);
end


% =============================================================

end
