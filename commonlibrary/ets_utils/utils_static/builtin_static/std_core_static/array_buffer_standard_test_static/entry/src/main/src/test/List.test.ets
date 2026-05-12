import arrayBufferAtTest from "./arrayBuffer/ArrayBufferAtTest.test";
import arrayBufferBytesLengthTest from "./arrayBuffer/ArrayBufferBytesLengthTest.test";
import arrayBufferPropertyTest from "./arrayBuffer/ArrayBufferPropertyTest.test";

export default function testsuite(): void {
  arrayBufferPropertyTest();
  arrayBufferAtTest();
  arrayBufferBytesLengthTest();
}