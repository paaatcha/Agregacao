%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TOPSIS
%
% Author: Andre Pacheco
% Orienters: Renato Krohling
%
% This file contains the algorithm TOPSIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef TOPSIS < handle % Handle proprierty assures that all copies of a object share the same data
    properties
        vector_cost_or_benefit %1 is cost and 0 is benefit
        matrixD
        matrixDNorm
        vectorW
        nCriteria
        nAlternative
        posA
        negA
        vDPlus
        vDLess   
        rCloseness
    end % properties
    
    methods
        
        %Constructor
        function dm = TOPSIS (matrixD,weightV,vector_cost_or_benefit)
            if nargin == 0
                return
            end
            dm.vector_cost_or_benefit = vector_cost_or_benefit;
            dm.matrixD = matrixD;
            dm.matrixDNorm = matrixD;
            dm.vectorW = weightV;
            [dm.nAlternative dm.nCriteria] = size(matrixD);  
            
             %dm.normalizeMatrix;   
             dm.introWeights;
             dm.getIdealSolutions;
             dm.distanceToIdeal;
             dm.relativeCloseness;
             dm.plotRanking; 
             %dm.plotRankingBars;
        end % Constructor     
        
        %Normalize matrixD
        function normalizeMatrix (A)
            m = A.matrixD.^2;
            m = sqrt(sum(m));
            A.matrixDNorm = zeros (A.nAlternative,A.nCriteria);
            
            for i=1:A.nAlternative
               for j=1:A.nCriteria
                    A.matrixDNorm(i,j) = (A.matrixD(i,j)/m(j));%*A.vectorW(j);
               end                
            end                  
        end % normalizeMteriz
        
        % this function just multiplies the matrixN by vector weights
        function introWeights (A)
            %A.matrixDNorm = zeros (A.nAlternative,A.nCriteria);
            for i=1:A.nAlternative
               for j=1:A.nCriteria
                    A.matrixDNorm(i,j) = (A.matrixDNorm(i,j))*A.vectorW(j);
               end                
            end                  
        end % normalizeMteriz
        
        %this function find de ideal solutions to each criteria
        function getIdealSolutions (A)
            mx = max(A.matrixDNorm);
            mi = min(A.matrixDNorm);
            A.posA = zeros (1,A.nCriteria);
            A.negA = zeros (1,A.nCriteria);            
            
            for j=1:A.nCriteria
                if A.vector_cost_or_benefit(j) == 1
                    A.posA(j) = mi(j);
                    A.negA(j) = mx(j);
                else
                    A.posA(j) = mx(j);    
                    A.negA(j) = mi(j);
                end
            end                 
        end %getIdealSolution
        
        %this funtion calculate the distance to each element to ideal
        %solutions
        function distanceToIdeal (A)
            A.vDPlus = zeros (A.nAlternative,1);
            A.vDLess = zeros (A.nAlternative,1);
            
            for i=1:A.nAlternative
               for j=1:A.nCriteria
                    A.vDPlus(i) = A.vDPlus(i) + distance(A.matrixDNorm(i,j),A.posA(j));
                    A.vDLess(i) = A.vDLess(i) + distance(A.matrixDNorm(i,j),A.negA(j));
               end          
               A.vDPlus(i) = sqrt(A.vDPlus(i));
               A.vDLess(i) = sqrt(A.vDLess(i));
            end             
        end %distanceToIdeal
   
        % this function find the relative closeness Ksi
        function relativeCloseness (A)
            A.rCloseness = zeros (A.nAlternative,1);
            
            for i=1:A.nAlternative
               A.rCloseness(i) = A.vDLess(i)/(A.vDPlus(i)+A.vDLess(i));
            end            
        end % relativeCloseness
        
        % this function plot the bars ranking
        function plotRankingBars (A)
            vecAux = 1:A.nAlternative;    
            bar(vecAux,A.rCloseness);
            grid on;
        end %plotRankingBars
        
        function final = plotRanking (A)
            aux = sort(A.rCloseness,'descend');
            positions = zeros (A.nAlternative,1);
            
            for i=1:A.nAlternative
                for i2=1:A.nAlternative
                   if aux(i) == A.rCloseness(i2)
                       positions(i) = i2;
                   end
                end
            end
            
            final = zeros (A.nAlternative,3);
            final (:,1) = 1:A.nAlternative;
            final (:,2) = positions;
            final (:,3) = aux;
        end %plotRankingBars
        
        
        
    end %methods
    
end %classdef

        
%eucliden distance
function d = distance (a,b)
    d = ((a-b)^2);
end % distance
