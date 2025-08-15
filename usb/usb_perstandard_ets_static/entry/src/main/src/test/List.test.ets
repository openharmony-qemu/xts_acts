import UsbTransferTest from "./UsbTransferTest.test";
import UsbBaseTest from "./UsbBaseTest.test";
import SerialTest from "./SerialTest.test";
import SerialSingleTest from "./SerialSingleTest.test";
import SerialEnumTest from "./SerialEnumTest.test";
import UsbManagerEnumTest from "./UsbManagerEnumTest.test";
export default function testsuite() {
  UsbTransferTest();
  UsbBaseTest();
  SerialTest();
  SerialSingleTest();
  SerialEnumTest();
  UsbManagerEnumTest();
}