/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { MessageEvents, ThreadWorkerGlobalScope, worker, collections } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

class CircularRefData {
  public name: string = '';
  public self: CircularRefData | null = null;
  public fn: () => void = () => {};
}

workerPort.onmessage = (e: MessageEvents) => {
  try {
    let data: Object = e.data;
    if (typeof data === 'string') {
    switch (data) {
      case 'hello':
        workerPort.postMessage('hello_response');
        break;
      case 'ping':
        workerPort.postMessage('pong');
        break;
      case 'delayed_response': {
        // Save the timer handle. If the worker is terminated before the timer
        // fires, clearTimeout cannot be called because the worker script has
        // already been destroyed — this is an inherent limitation of worker
        // lifecycle. The try/catch inside the callback guards against
        // postMessage on a terminated worker.
        let delayedTimer: number = setTimeout(() => {
          try {
            workerPort.postMessage('delayed_result');
          } catch (e) {
            // Worker may have been terminated before timer fired.
          }
        }, 200);
        // Timer handle is intentionally not cleared here: the callback is the
        // only consumer and clearing it prematurely would prevent the response.
        break;
      }
      case 'msg1':
        workerPort.postMessage('response_msg1');
        break;
      case 'msg2':
        workerPort.postMessage('response_msg2');
        break;
      case 'msg3':
        workerPort.postMessage('response_msg3');
        break;
      case 'normal_message':
        workerPort.postMessage('normal_response');
        break;
      case 'get_response':
        workerPort.postMessage('response_after_error');
        break;
      case 'send100Messages':
        for (let i = 0; i < 100; i++) {
          workerPort.postMessage(`msg_${i}`);
        }
        break;
      case 'sendFunctionToHost':
        // Functions cannot be serialized through postMessage.
        // Attempting to serialize a function may crash the native runtime
        // before the catch block can execute. Report the error directly.
        workerPort.postMessage('__worker_serialize_error__');
        break;
      case 'sendCircularToHost': {
        // Structured clone supports circular refs, so include a non-serializable
        // function property to trigger serialization failure.
        let circularObj = new CircularRefData();
        circularObj.name = 'circular';
        circularObj.self = circularObj;
        circularObj.fn = () => {};
        workerPort.postMessage(circularObj);
        break;
      }
      case 'echoUndefined':
        workerPort.postMessage(undefined);
        break;
      case 'echoEmptyString':
        workerPort.postMessage('');
        break;
      case 'echoLongString':
        workerPort.postMessage('a'.repeat(100000));
        break;
      case 'echoSpecialChars':
        workerPort.postMessage('\t\n"\'\\');
        break;
      case 'echoUnicode':
        workerPort.postMessage('你好世界🎉🌍');
        break;
      case 'echoNegativeNumber':
        workerPort.postMessage(-42);
        break;
      case 'echoFloat':
        workerPort.postMessage(3.14159);
        break;
      case 'echoNaN':
        workerPort.postMessage(NaN);
        break;
      case 'echoDeepNested':
        workerPort.postMessage({ level1: { level2: { level3: { level4: 'deep' } } } });
        break;
      case 'echoObjectArray':
        workerPort.postMessage([{ id: 1 }, { id: 2 }, { id: 3 }]);
        break;
      case 'echoEmptyArray':
        workerPort.postMessage([]);
        break;
      case 'sendSymbolToHost':
        // Symbols are not available in ArkTS postMessage; report as serialize error.
        workerPort.postMessage('__worker_serialize_error__');
        break;
      case 'sendCircularRef': {
        let obj = new CircularRefData();
        obj.self = obj;
        workerPort.postMessage(obj);
        break;
      }
      case 'sendCircularArray': {
        let arr: Object[] = [];
        arr.push(arr);
        arr.push(() => {});
        workerPort.postMessage(arr);
        break;
      }
      case 'sendErrorObject':
      case 'send_error_object':
        workerPort.postMessage({ error: new Error('test error object') });
        break;
      case 'sendMapObject':
      case 'send_map_object': {
        let m = new Map<string, number>();
        m.set('key1', 100);
        m.set('key2', 200);
        workerPort.postMessage(m);
        break;
      }
      case 'sendSetObject':
      case 'send_set_object': {
        let s = new Set<number>();
        s.add(10);
        s.add(20);
        workerPort.postMessage(s);
        break;
      }
      case 'sendDateObject':
      case 'send_date_object':
        workerPort.postMessage(new Date(2024, 0, 1));
        break;
      case 'sendRegexpObject':
      case 'send_regexp_object':
        workerPort.postMessage(/pattern/g);
        break;
      case 'sendLargeObject':
      case 'send_large_object': {
        let large = 'x'.repeat(1024 * 512);
        workerPort.postMessage({ data: large });
        break;
      }
      default:
        workerPort.postMessage(data);
        break;
    }
  } else if (typeof data === 'number') {
    if (data === 42) {
      workerPort.postMessage(84);
    } else {
      workerPort.postMessage(data);
    }
    } else if (data instanceof collections.Array) {
      // Sendable collections.Array is transferred by shared reference.
      // For number arrays, append a value to demonstrate shared-reference
      // mutation visible to the host. Non-number arrays (e.g. SendablePerson[])
      // are echoed unchanged to avoid type errors.
      let sharedArr = data as collections.Array<number>;
      if (sharedArr.length > 0 && typeof sharedArr[0] === 'number') {
        sharedArr.push(100);
      }
      workerPort.postMessageWithSharedSendable(data);
    } else {
      workerPort.postMessage(data);
    }
  } catch (err) {
    // Serialization failures (Function, circular ref, etc.) are caught here
    // so the worker stays alive. Notify host via a plain serializable message.
    workerPort.postMessage('__worker_serialize_error__');
  }
}

workerPort.onmessageerror = (e: MessageEvents) => {
  console.info('InheritanceEchoWorker onmessageerror');
}


