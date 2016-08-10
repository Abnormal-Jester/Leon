% The imagePoints property is a 3d array that contains points that correspond
% to the checkerboards on image set with the same index.

% obj = ImageSetData(imagePoints, imageSet) Construct an ImageSetData object

% obj = ImageSetData(imagePoints, imageSet, imagePairsUsed) Construct an
%   ImageSetData object, using the unused image pairs to indicate where the
%   missing image points are located and filling the gaps with zero arrays

% obj = addPoints(obj, pointIndex, pointSet) Overwrite the 2d point set at
% the indicated index

% image = getImage(obj, number) Obtain the image at the indicated index

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
         elseif nargin == 3,
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

      function obj = addPoints(obj, pointIndex, pointSet)
         obj.imagePoints(:,:,pointIndex) = pointSet;
      end

      function image = getImage(obj, number)
         image = obj.imageSet.ImageLocation(number);
         image = image{1,1};
      end

   end
end
