import imageHDR from './imageHDR.test';
import inferenceTest from './ImageInference.test';

import dequeueImageTest from './ImageCreator/DequeueImage.test';
import dequeueImageCallbackTest from './ImageCreator/DequeueImageCallback.test';
import queueImageImageTest from './ImageCreator/QueueImageImage.test';
import queueImageImageCallbackTest from './ImageCreator/QueueImageImageCallback.test';
import releaseTest from './ImageCreator/Release.test';
import releaseCallbackTest from './ImageCreator/ReleaseCallback.test';
import OnTest from './ImageCreator/On.test';
import OffTest from './ImageCreator/Off.test';
  
export default function testsuite() {
  imageHDR();
  inferenceTest();

  dequeueImageTest();
  dequeueImageCallbackTest();
  queueImageImageTest();
  queueImageImageCallbackTest();
  releaseTest();
  releaseCallbackTest();
  OnTest();
  OffTest();
}