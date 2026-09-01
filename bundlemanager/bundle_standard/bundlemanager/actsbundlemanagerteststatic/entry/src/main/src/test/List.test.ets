'use static';
import GetBundleInfo from "./GetBundleInfo.test";
import GetAppCloneIdentityTest from "./GetAppCloneIdentity.test.ets";
import getLaunchWant from './GetLaunchWant.test.ets';
import GetLaunchWantForBundleSyncStatic from "./GetLaunchWantForBundleSyncStatic.test.ets";
import getBundleInstallStatusNoPermissionTest from './GetBundleInstallStatusNoPermission.test.ets';

export default function testsuite(): void {
  GetBundleInfo();
  GetAppCloneIdentityTest();
  getLaunchWant();
  GetLaunchWantForBundleSyncStatic();
  getBundleInstallStatusNoPermissionTest();
}
