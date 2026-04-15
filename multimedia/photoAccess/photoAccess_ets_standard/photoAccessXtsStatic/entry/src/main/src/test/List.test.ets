import getAssetsTest from "./photoAccessHelper/PhotoAccessHelper.test";
import photoAccessHelperNoPermissionStaticTest from "./PhotoAccessHelperNoPermission.test";
import photoAccessHelperReadPermissionStaticTest from "./PhotoAccessHelperReadPermission.test";
export default function testsuite(): void {
  photoAccessHelperNoPermissionStaticTest();
  photoAccessHelperReadPermissionStaticTest();
  getAssetsTest();
}
