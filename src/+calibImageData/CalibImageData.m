classdef CalibImageData
   properties
      mImagePoints
      mImageSet
      mDir
      mPrefix
      mType
      mImagesUsed
      mBoardSize
   end
   methods
      function obj = CalibImageData(imagePoints,imageSet,dir,prefix,type,imagesUsed,boardSize)
         if nargin == 7
            obj.mImagePoints = imagePoints;
            obj.mImageSet = imageSet;
            obj.mDir = dir;
            obj.mPrefix = prefix;
            obj.mType = type;
            obj.mImagesUsed = imagesUsed;
            obj.mBoardSize = boardSize;
         else
            error('Wrong number of input arguments')
         end
      end
   end
end
