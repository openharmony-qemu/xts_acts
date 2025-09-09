import { Stack } from '@kit.ArkTS';
import { C1 } from './importclass';


@Concurrent
export function stackPush() {
  let TAG = 'stackPush'
  try {
    try {
      let stack: Stack<number> = new Stack();
      let result = stack.push(1)
      // expect(result).assertEqual(1);
    if (result !== 1){
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function stackPop() {
  let TAG = 'stackPop'
  try {
    try {
      let stack: Stack<number | string | object> = new Stack();
      stack.push(undefined)
      let result = stack.pop()
      // expect(result).assertEqual(undefined);
      if (result !== undefined){
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function stackPeek() {
  let TAG = 'stackPeek'
  try {
    try {
      let stack: Stack<number | string | object> = new Stack();
      let a: C1 = {
        name: "Dylon", age: "13"
      };
      let b = 'a'
      let c = 1
      stack.push(a)
      stack.push(b)
      stack.push(c)
      let result = stack.peek();
      // expect(result).assertEqual(c);
      if (result !== c ) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export function stackLocate() {
  let TAG = 'stackLocate'
  try {
    try {
      let stack: Stack<number | string | object> = new Stack();
      let a: C1 = {
        name: "Dylon", age: "13"
      };
      let b = 'a'
      let c = 1
      stack.push(a)
      stack.push(b)
      stack.push(c)
      let result = stack.locate(a);
      // expect(result).assertEqual(0);
      if (result !== 0 ) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
      // expect().assertFail();
    }

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export function stackForEach() {
  let TAG = 'stackForEach'
  try {
    try {
      let stack: Stack<number> = new Stack();
      stack.push(1)
      stack.push(2)
      stack.push(3)
      stack.push(3)
      stack.forEach((item, index) => {
        let result1 = item
        let result2 = index
        // expect(result1).assertEqual(item);
        if (result1 !==item) {
          throw new Error(`${TAG} value.toString() invalid: ${result1.toString()}`)
        }
        // expect(result2).assertEqual(index);
        if (result2 !==index) {
          throw new Error(`${TAG} value.toString() invalid: ${result2}`)
        }
      })
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function stackIsEmpty() {
  let TAG = 'stackIsEmpty'
  try {
    try {
      let stack: Stack<number> = new Stack();
      stack.push(1)
      stack.push(2)
      stack.push(3)
      stack.push(3)
      let result = stack.isEmpty()
      // expect(result).assertEqual(false);
      if (result !==false) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function stackLength() {
  let TAG = 'stackLength'
  try {
    try {
      let stack: Stack<number> = new Stack();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.push(3);
      let result = stack.length;
      // expect(result).assertEqual(4);
      if (result !==4) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
      // expect().assertFail();
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}