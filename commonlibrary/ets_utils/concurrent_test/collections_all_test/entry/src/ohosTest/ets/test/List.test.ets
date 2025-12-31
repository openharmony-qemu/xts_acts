import builtinsArrayCopyWithinTest from './array/BuiltinsArrayCopyWithinTest.test';
import builtinsArrayEntriesTest from './array/BuiltinsArrayEntriesTest.test';
import builtinsArrayFromTest from './array/BuiltinsArraysFromTest.test';
import builtinsArrayIsArrayTest from './array/BuiltinsArrayIsArray.test';
import builtinsArraySpliceTest from './array/BuiltinsArraySplicesTest.test';
import builtinsArrayValuesTest from './array/BuiltinsArrayValues.test';
import builtinsArrayAtTest from './array/BuiltinsArrayAtTest.test';
import builtinsArrayConstructorTest from './array/BuiltinsArrayConstructorTest.test';
import builtinsArrayKeysTest from './array/BuiltinsArrayKeysTest.test';
import builtinsArrayConstructor1Test from './array/BuiltinsArrayCombination1Test.test';


import builtinsArrayBufferByteLengthTest from "./ArrayBuffer/BuiltinsArrayBufferByteLengthTest.test";
import builtinsArrayBufferConstructorTest from "./ArrayBuffer/BuiltinsArrayBufferConstructorTest.test";
import builtinsArrayBufferIsViewTest from "./ArrayBuffer/BuiltinsArrayBufferIsViewTest.test";
import builtinsArrayBufferLikeTest from "./ArrayBuffer/BuiltinsArrayBufferLikeTest.test";
import builtinsArrayBufferSliceTest from "./ArrayBuffer/BuiltinsArrayBufferSliceTest.test";
import builtinsArrayBufferViewTest from "./ArrayBuffer/BuiltinsArrayBufferViewTest.test";
import builtinsConcatArrayIndexTest from "./ArrayBuffer/BuiltinsConcatArrayIndexTest.test";
import builtinsConcatArrayJoinTest from "./ArrayBuffer/BuiltinsConcatArrayJoinTest.test";
import builtinsConcatArrayLengthTest from "./ArrayBuffer/BuiltinsConcatArrayLengthTest.test";
import builtinsConcatArraySliceTest from "./ArrayBuffer/BuiltinsConcatArraySliceTest.test";

import typeArrayBigInt64ArrayTest from './TypeArray/TypeArrayBigInt64Array.test';
import typeArrayBigUint64ArrayTest from './TypeArray/TypeArrayBigUint64Array.test';
import typeArrayFloat32ArrayTest from './TypeArray/TypeArrayFloat32Array.test';
import typeArrayFloat64ArrayTest from './TypeArray/TypeArrayFloat64Array.test';
import typeArrayInt16ArrayTest from './TypeArray/TypeArrayInt16Array.test';
import typeArrayInt32ArrayTest from './TypeArray/TypeArrayInt32Array.test';
import typeArrayInt8ArrayTest from './TypeArray/TypeArrayInt8Array.test';
import typeArrayUint16ArrayTest from './TypeArray/TypeArrayUint16Array.test';
import typeArrayUint32ArrayTest from './TypeArray/TypeArrayUint32Array.test';
import typeArrayUint8ArrayTest from './TypeArray/TypeArrayUint8Array.test';
import typeArrayUint8ClampedArrayTest from './TypeArray/TypeArrayUint8ClampedArray.test';






export default function testsuite() {

  builtinsArrayEntriesTest();
  builtinsArrayCopyWithinTest();
  builtinsArrayIsArrayTest();
  builtinsArrayValuesTest();
  builtinsArraySpliceTest();
  builtinsArrayFromTest();
  builtinsArrayAtTest();
  builtinsArrayConstructorTest();
  builtinsArrayKeysTest();
  builtinsArrayConstructor1Test();

  builtinsArrayBufferByteLengthTest();
  builtinsArrayBufferConstructorTest();
  builtinsArrayBufferIsViewTest();
  builtinsArrayBufferLikeTest();
  builtinsArrayBufferSliceTest();
  builtinsArrayBufferViewTest();
  builtinsConcatArrayIndexTest();
  builtinsConcatArrayJoinTest();
  builtinsConcatArrayLengthTest();
  builtinsConcatArraySliceTest();

  typeArrayBigInt64ArrayTest();
  typeArrayBigUint64ArrayTest();
  typeArrayFloat32ArrayTest();
  typeArrayFloat64ArrayTest();
  typeArrayInt8ArrayTest();
  typeArrayInt16ArrayTest();
  typeArrayInt32ArrayTest();
  typeArrayUint8ArrayTest();
  typeArrayUint8ClampedArrayTest();
  typeArrayUint16ArrayTest();
  typeArrayUint32ArrayTest();

}