function [Ainv] = linalg_inv_rr(P)
%% ***********************************************************************
% FUNCTION linalg_inv_rr
% Purpose: Calculates the inverse of a matrix using row reducing methods.
% Additionally will check if the matrix is square, and will return the
% pseudoinverse, if not.
%
% Function call: [Ainv] = linalg_inv_rr(A)
%
% Input: A = Input matrix to be inverted
%
% Outputs: Ainv = the inverted matrix
%
% Adam Hollock
% 19 January 2012
%% ***********************************************************************
%This will take the pseudoinverse in case the matrix in question is not
%square.
if size(P,1) < size(P,2)            %Underdetermined case
    Ainv = P.'*linalg_inv_rr(P*P.');
elseif size(P,1) > size(P,2)        %Overdetermined case
    Ainv = linalg_inv_rr(P.'*P)*P.';
else
    Atest = P;

%Augments the original matrix with the identity matrix
    A = cat(2,Atest,eye(size(Atest)));

% %This will normalize all of the rows to the largest number in the first
% %column
% maxValue = max(A(:,1))
% for k = 1:(size(A,1)-1)
%     A(k,:) = A(k,:).*(maxValue/(A(k,1)))
% end

%This is the first step of gaussian elimination, eliminating the bottom
%terms
    for k=1:(size(A,1)-1)
        for l=k+1:size(A,1)
            maxValue = A(l,k)/A(k,k);
            A(l,:) =  -1*A(k,:).*maxValue + A(l,:);
        end
    end

%This is the second step of gaussian elimination, eliminating the top terms
    for k=size(P,1):-1:2
        for l=k-1:-1:1
            maxValue = A(l,k)/A(k,k);
            A(l,:) =  -1*A(k,:).*maxValue + A(l,:);
        end
    end
    

%This will normalize the matrix on the left into the identity matrix
    for i=1:size(A,1)
        A(i,:) = A(i,:)./A(i,i);
    end
%This will take the identity matrix out and just leave the inverse
    Ainv = A(:,size(A,1)+1:size(A,2));
end