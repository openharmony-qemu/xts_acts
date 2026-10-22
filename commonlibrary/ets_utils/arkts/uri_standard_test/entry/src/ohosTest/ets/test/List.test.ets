import test_0001 from './uri/Uri.test';
import test_0002 from './uri/Uri2.test';
import test_0003 from './uri/URITest01.test';
import test_0004 from './uri/URITest02.test';
import test_0005 from './uri/URITest03.test';
import test_0006 from './uri/URITest04.test';
import test_0007 from './uri/URITest05.test';
import { UriFPTest } from './urifp/UriFP.test';

export default function testsuite() {
  test_0001();
  test_0002();
  test_0003();
  test_0004();
  test_0005();
  test_0006();
  test_0007();
  UriFPTest();
}
