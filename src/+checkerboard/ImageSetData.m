classdef ImageSetData
   properties
      imagePoints;
      imageSet;
   end
   methods
      function obj = ImageSetData(imagePoints, imageSet, imagePairsUsed)
         if nargin == 2,
            obj.imagePoints = imagePoints;
            obj.imageSet = imageSet;
         elseif nargin ==3,
            obj = obj.setImagePoints(imagePoints, imagePairsUsed);
            obj.imageSet = imageSet;
         else
            error('Wrong number of input arguments');
         end
      end

      function obj = setImagePoints(obj, imagePoints, imagePairsUsed)
         count = 0;

         nImagePairsUsed = numel(imagePairsUsed);

         arraySize = size(imagePoints);
         arraySize(3) = nImagePairsUsed;

         obj.imagePoints = zeros(arraySize);

         for i=1:nImagePairsUsed,
            if imagePairsUsed(i),
               obj.imagePoints(:,:,i) = imagePoints(:,:,i-count);
            else
               count = count + 1;
            end
         end
      end
   end
end
