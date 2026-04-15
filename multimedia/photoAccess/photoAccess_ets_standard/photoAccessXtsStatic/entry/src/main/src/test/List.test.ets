import photoAccessHelperNoPermissionStaticTest from "./PhotoAccessHelperNoPermission.test";
import photoAccessHelperReadPermissionStaticTest from "./PhotoAccessHelperReadPermission.test";

export default function testsuite() {
  photoAccessHelperNoPermissionStaticTest();
  photoAccessHelperReadPermissionStaticTest();
}
