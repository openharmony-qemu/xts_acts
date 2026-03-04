import GetBundleInfo from "./GetBundleInfo.test";
import GetAppCloneIdentityTest from "./GetAppCloneIdentity.test.ets";
import getLaunchWant from './GetLaunchWant.test.ets';

export default function testsuite() {
  GetBundleInfo();
  GetAppCloneIdentityTest();
  getLaunchWant();
}
