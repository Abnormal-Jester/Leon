classdef CheckerboardData
   properties
      boardSize;
      imagePairsUsed;
   end
   methods
      function obj = CheckerboardData(boardSize, imagePairsUsed)
         if nargin == 2
            obj.boardSize = boardSize;
            obj.imagePairsUsed = imagePairsUsed;
         else
            error('Wrong number of input arguments')
         end
      end
   end
end
