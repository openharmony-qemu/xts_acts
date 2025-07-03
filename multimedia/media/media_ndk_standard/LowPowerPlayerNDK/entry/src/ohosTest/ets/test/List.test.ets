import OhLPPAudioNDKTest from './OhLPPAudioNDKTest.test';
import OhLPPVideoNDKTest from './OhLPPVideoNDKTest.test';
import OhLPPMp4NDKTest from './OhLPPMp4NDKTest.test';

export default function testsuite() {
  OhLPPAudioNDKTest();
  OhLPPVideoNDKTest();
  OhLPPMp4NDKTest();
}