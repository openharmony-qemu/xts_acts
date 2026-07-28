'use static';

export function testArrayConstructor1(): void {
  let TAG = 'testArrayConstructor1'
  try {
    let element0 = 'app';
    let obj = new Array<string>(element0);
    if (JSON.stringify(obj) !== `["app"]`) {
      throw new Error(`${TAG} Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayFrom1(): void {
  let TAG = 'testArrayFrom1'
  try {
    const set = new Set<string>(['foo', 'bar', 'baz', 'foo']);
    let obj = Array.from(set);
    console.info('===========',JSON.stringify(obj))
    if (JSON.stringify(obj) !== '[\"foo\",\"bar\",\"baz\"]') {
      throw new Error(`${TAG} Array.from failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayIsArray1(): void {
  let TAG = 'testArrayIsArray1'
  try {
    let arr:int[] = []
    let result = Array.isArray(arr);
    if (result !== true) {
      throw new Error(`${TAG} Array.isArray failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayOf1(): void {
  let TAG = 'testArrayOf1'
  try {
    let result = Array.of(1);
    if (JSON.stringify(result) !== '[1]') {
      throw new Error(`${TAG} Array.of failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayConcat1(): void {
  let TAG = 'testArrayConcat1'
  try {
    const letters1 = ['a', 'b', 'c'];
    const letters2 = ['D', 'E', 'F'];
    const alphaNumeric = letters1.concat(letters2);
    if (JSON.stringify(alphaNumeric) !== '["a","b","c","D","E","F"]') {
      throw new Error(`${TAG} Array concat failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayCopyWithin1(): void {
  let TAG = 'testArrayCopyWithin1'
  try {
    let arr1:int[] = [1, 2, 3, 4, 5];
    const obj = arr1.copyWithin(-2, 1);
    if (JSON.stringify(obj) !== '[1,2,3,2,3]') {
      throw new Error(`${TAG} Array copyWithin failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayFill1(): void {
  let TAG = 'testArrayFill1'
  try {
    let arr:int[] = [1, 2, 3];
    let obj = arr.fill(4);
    if (JSON.stringify(obj) !== '[4,4,4]') {
      throw new Error(`${TAG} Array fill failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayFind1(): void {
  let TAG = 'testArrayFind1'
  try {
    const array1:int[] = [11, 12];
    const found = array1.find((element) => element > 10);
    if (JSON.stringify(found) !== '11') {
      throw new Error(`${TAG} Array find failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayFlat1(): void {
  let TAG = 'testArrayFlat1'
  try {
    const arr1 = [0, 1, 2, [3, 4]];
    const found = arr1.flat();
    if (JSON.stringify(found) !== '[0,1,2,3,4]') {
      throw new Error(`${TAG} Array flat failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayFlatMap1(): void {
  let TAG = 'testArrayFlatMap1'
  try {
    const arr1 = [1, 2, 1];
    const result = arr1.flatMap((num) => (num === 2 ? [2, 2] : 1));
    if (JSON.stringify(result) !== '[1,2,2,1]') {
      throw new Error(`${TAG} Array flatMap failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayIncludes1(): void {
  let TAG = 'testArrayIncludes1'
  try {
    const array1 = [1, 2, 3];
    const result = array1.includes(2);
    if (result !== true) {
      throw new Error(`${TAG} Array includes failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayIndexOf1(): void {
  let TAG = 'testArrayIndexOf1'
  try {
    const array = [2, 9, 9];
    const result = array.indexOf(2);
    if (result !== 0) {
      throw new Error(`${TAG} Array indexOf failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayJoin1(): void {
  let TAG = 'testArrayJoin1'
  try {
    const array = ['Wind', 'Water', 'Fire'];
    const result = array.join();
    if (result !== 'Wind,Water,Fire') {
      throw new Error(`${TAG} Array join failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayKeys1(): void {
  let TAG = 'testArrayKeys1'
  try {
    const arr = ['a', 'b', 'c'];
    const sparseKeys = Object.keys(arr);
    if (JSON.stringify(sparseKeys) !== '["0","1","2"]') {
      throw new Error(`${TAG} Array keys failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayLastIndexOf1(): void {
  let TAG = 'testArrayLastIndexOf1'
  try {
    const numbers = [2, 5, 9, 2];
    const result = numbers.lastIndexOf(2);
    if (result !== 3) {
      throw new Error(`${TAG} Array lastIndexOf failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayMap1(): void {
  let TAG = 'testArrayMap1'
  try {
    const numbers = [1, 4, 9];
    const roots = numbers.map((num) => Math.sqrt(num));
    if (JSON.stringify(roots) !== '[1,2,3]') {
      throw new Error(`${TAG} Array map failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayPop1(): void {
  let TAG = 'testArrayPop1'
  try {
    const myFish = ['app', 'banana', 'cat', 'duck'];
    const popped = myFish.pop();
    if (popped !== 'duck') {
      throw new Error(`${TAG} Array pop failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayPush1(): void {
  let TAG = 'testArrayPush1'
  try {
    const sports = ['soccer', 'baseball'];
    const total = sports.push('football', 'swimming');
    if (total !== 4) {
      throw new Error(`${TAG} Array push failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayReduceRight1(): void {
  let TAG = 'testArrayReduceRight1'
  try {
    const sum = [0, 1, 2, 3].reduceRight((a, b) => a + b);
    if (sum !== 6) {
      throw new Error(`${TAG} Array reduceRight failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayReverse1(): void {
  let TAG = 'testArrayReverse1'
  try {
    const items = [1, 2, 3];
    const result = items.reverse();
    if (JSON.stringify(result) !== '[3,2,1]') {
      throw new Error(`${TAG} Array reverse failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayShift1(): void {
  let TAG = 'testArrayShift1'
  try {
    const array1 = [1, 2, 3];
    const result = array1.shift();
    if (result !== 1) {
      throw new Error(`${TAG} Array shift failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArraySlice1(): void {
  let TAG = 'testArraySlice1'
  try {
    const fruits = ['Banana', 'Orange', 'Lemon', 'Apple', 'Mango'];
    const result = fruits.slice(0);
    if (JSON.stringify(result) !== '["Banana","Orange","Lemon","Apple","Mango"]') {
      throw new Error(`${TAG} Array slice failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArraySome1(): void {
  let TAG = 'testArraySome1'
  try {
    let array = [1, 2, 3];
    const result = array.some((x) => x === 1);
    if (result !== true) {
      throw new Error(`${TAG} Array some failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArraySort1(): void {
  let TAG = 'testArraySort1'
  try {
    const value = ['Cat', 'Duck', 'Zoo', 'Apple', 'Desk'];
    const result = value.sort();
    if (JSON.stringify(result) !== '["Apple","Cat","Desk","Duck","Zoo"]') {
      throw new Error(`${TAG} Array sort failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArraySplice1(): void {
  let TAG = 'testArraySplice1'
  try {
    const months = ['Jan', 'March', 'April', 'June'];
    months.splice(1, 0, 'Feb');
    if (JSON.stringify(months) !== '["Jan","Feb","March","April","June"]') {
      throw new Error(`${TAG} Array splice failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArraySymbolIterator1(): void {
  let TAG = 'testArraySymbolIterator1'
  try {
    const array1 = ['a', 'b', 'c'];
    const iterator1 = array1.$_iterator();
    const first = iterator1.next();
    if (JSON.stringify(first) !== '{"value":"a","done":false}') {
      throw new Error(`${TAG} Array Symbol.iterator failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayToLocaleString1(): void {
  let TAG = 'testArrayToLocaleString1'
  try {
    const array1: string[] = [];
    const iterator1 = array1.toLocaleString();
    if (iterator1 !== '') {
      throw new Error(`${TAG} Array toLocaleString failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayToString1(): void {
  let TAG = 'testArrayToString1'
  try {
    const array1 = [1, 2, 'a', '1a'];
    const result = array1.toString();
    if (result !== '1,2,a,1a') {
      throw new Error(`${TAG} Array toString failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayUnshift1(): void {
  let TAG = 'testArrayUnshift1'
  try {
    let arr = [4, 5, 6];
    let value = arr.unshift(1, 2, 3);
    if (value !== 6) {
      throw new Error(`${TAG} Array unshift failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayValues1(): void {
  let TAG = 'testArrayValues1'
  try {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const iterator = arr.values();
    let val1 = iterator.next();
    if (JSON.stringify(val1) !== '{"value":"a","done":false}') {
      throw new Error(`${TAG} Array values failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}