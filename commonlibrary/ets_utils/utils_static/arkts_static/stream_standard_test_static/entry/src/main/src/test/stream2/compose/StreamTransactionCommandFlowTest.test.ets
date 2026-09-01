'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { stream } from '@kit.ArkTS';
import { ThirdBatchTextReadable } from '../../StreamComposeTestBase';
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';

class TransactionCommandWritable extends stream.Writable {
  public pending: string = '';
  public committedTotal: int = 0;
  public workingTotal: int = 0;
  public transactionActive: boolean = false;
  public commitCount: int = 0;
  public rollbackCount: int = 0;
  public rejectedCount: int = 0;
  public commandCount: int = 0;
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.pending += chunk.toString();
    this.writeCount++;
    let terminator: int = this.pending.indexOf(';');
    while (terminator >= 0) {
      let command: string = this.pending.substring(0, terminator);
      this.pending = this.pending.substring(terminator + 1);
      this.commandCount++;
      if (command === 'BEGIN') {
        if (this.transactionActive) {
          this.rejectedCount++;
        } else {
          this.transactionActive = true;
          this.workingTotal = 0;
        }
      } else if (command.indexOf('ADD:') === 0) {
        let value: number = Number(command.substring(4));
        if (!this.transactionActive || !Number.isInteger(value)) {
          this.rejectedCount++;
        } else {
          this.workingTotal += value.toInt();
        }
      } else if (command === 'COMMIT') {
        if (!this.transactionActive) {
          this.rejectedCount++;
        } else {
          this.committedTotal += this.workingTotal;
          this.workingTotal = 0;
          this.transactionActive = false;
          this.commitCount++;
        }
      } else if (command === 'ROLLBACK') {
        if (!this.transactionActive) {
          this.rejectedCount++;
        } else {
          this.workingTotal = 0;
          this.transactionActive = false;
          this.rollbackCount++;
        }
      } else {
        this.rejectedCount++;
      }
      terminator = this.pending.indexOf(';');
    }
    callback.unsafeCall();
  }
}

export default function StreamTransactionCommandFlowTest(): void {
  describe('StreamTransactionCommandFlowTest', (): void => {

    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: (value: void) => void): void => {
        setTimeout((): void => resolve(undefined as void), 0);
      });

    });

    beforeAll((): void => {
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0100
     * @tc.name testStreamTransactionCommandFlow001
     * @tc.desc Verify BEGIN, ADD:5, and COMMIT produce committed total 5 in one end(data) call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end('BEGIN;ADD:5;COMMIT;', 'utf8');
        });
        expect(capturedCommittedTotal).assertEqual(5);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(3);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0200
     * @tc.name testStreamTransactionCommandFlow002
     * @tc.desc Verify a two-chunk command Readable commits both a negative and a zero addition through the transaction sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let addValues: string[] = ['BEGIN;ADD:-7;', 'BEGIN;ADD:0;'];
        let expectedTotals: int[] = [-7, 0];
        for (let i = 0; i < addValues.length; i++) {
          let capturedCommittedTotal: int = 0;
          let capturedWorkingTotal: int = 0;
          let capturedTransactionActive: boolean = false;
          let capturedCommitCount: int = 0;
          let capturedCommandCount: int = 0;
          let capturedPending: string = '';
          let capturedWriteCount: int = 0;
          let capturedWritableFinished: boolean = false;
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new TransactionCommandWritable();
            sink.on('finish', (): void => {
              capturedCommittedTotal = sink.committedTotal;
              capturedWorkingTotal = sink.workingTotal;
              capturedTransactionActive = sink.transactionActive;
              capturedCommitCount = sink.commitCount;
              capturedCommandCount = sink.commandCount;
              capturedPending = sink.pending;
              capturedWriteCount = sink.writeCount;
              capturedWritableFinished = sink.writableFinished;
              resolve(undefined as void);
            });
            let commandSource = new ThirdBatchTextReadable([addValues[i], 'COMMIT;']);
            commandSource.on('data', (chunk: Object): void => {
              sink.write(chunk.toString(), 'utf8');
            });
            commandSource.on('end', (): void => {
              sink.end();
            });
            commandSource.resume();
          });
          expect(capturedCommittedTotal).assertEqual(expectedTotals[i]);
          expect(capturedWorkingTotal).assertEqual(0);
          expect(capturedTransactionActive).assertFalse();
          expect(capturedCommitCount).assertEqual(1);
          expect(capturedCommandCount).assertEqual(3);
          expect(capturedPending).assertEqual('');
          expect(capturedWriteCount).assertEqual(2);
          expect(capturedWritableFinished).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0300
     * @tc.name testStreamTransactionCommandFlow003
     * @tc.desc Verify corked BEGIN and ADD are discarded by ROLLBACK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write('BEGIN;', 'utf8');
          sink.write('ADD:9;', 'utf8');
          sink.uncork();
          sink.end('ROLLBACK;', 'utf8');
        });
        expect(capturedCommittedTotal).assertEqual(0);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(0);
        expect(capturedRollbackCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(3);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0400
     * @tc.name testStreamTransactionCommandFlow004
     * @tc.desc Verify an empty transaction COMMIT closes cleanly without a working value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write('BEGIN;', 'utf8');
          sink.end('COMMIT;', 'utf8');
        });
        expect(capturedCommittedTotal).assertEqual(0);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(2);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0500
     * @tc.name testStreamTransactionCommandFlow005
     * @tc.desc Verify a committed transaction is followed by an independent rolled-back transaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write('BEGIN;ADD:8;', 'utf8');
          sink.write('COMMIT;', 'utf8');
          sink.write('BEGIN;ADD:5;', 'utf8');
          sink.end('ROLLBACK;', 'utf8');
        });
        expect(capturedCommittedTotal).assertEqual(8);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(1);
        expect(capturedRollbackCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(6);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0600
     * @tc.name testStreamTransactionCommandFlow006
     * @tc.desc Verify character-by-character commands are parsed into one committed transaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] =
            ["B", "E", "G", "I", "N", ";", "A", "D", "D", ":", "2", ";", "C", "O", "M", "M", "I", "T", ";"];
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let commandSource = new ThirdBatchTextReadable(chunks);
          commandSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          commandSource.on('end', (): void => {
            sink.end();
          });
          commandSource.resume();
        });
        expect(capturedCommittedTotal).assertEqual(2);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(3);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(19);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0700
     * @tc.name testStreamTransactionCommandFlow007
     * @tc.desc Verify ADD and COMMIT outside an active transaction are rejected without changing totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let commands: string[] = ["ADD:5;", "COMMIT;"];
        for (let i = 0; i < commands.length; i++) {
          let capturedCommittedTotal: int = 0;
          let capturedWorkingTotal: int = 0;
          let capturedTransactionActive: boolean = false;
          let capturedRejectedCount: int = 0;
          let capturedCommandCount: int = 0;
          let capturedPending: string = "";
          let capturedWriteCount: int = 0;
          let capturedWritableFinished: boolean = false;
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new TransactionCommandWritable();
            sink.on("finish", (): void => {
              capturedCommittedTotal = sink.committedTotal;
              capturedWorkingTotal = sink.workingTotal;
              capturedTransactionActive = sink.transactionActive;
              capturedRejectedCount = sink.rejectedCount;
              capturedCommandCount = sink.commandCount;
              capturedPending = sink.pending;
              capturedWriteCount = sink.writeCount;
              capturedWritableFinished = sink.writableFinished;
              resolve(undefined as void);
            });
            sink.write(commands[i], "utf8");
            sink.end();
          });
          expect(capturedCommittedTotal).assertEqual(0);
          expect(capturedWorkingTotal).assertEqual(0);
          expect(capturedTransactionActive).assertFalse();
          expect(capturedRejectedCount).assertEqual(1);
          expect(capturedCommandCount).assertEqual(1);
          expect(capturedPending).assertEqual("");
          expect(capturedWriteCount).assertEqual(1);
          expect(capturedWritableFinished).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0800
     * @tc.name testStreamTransactionCommandFlow008
     * @tc.desc Verify nested BEGIN is rejected while the original transaction remains active
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let commandSource = new ThirdBatchTextReadable(['BEGIN;ADD:2;', 'BEGIN;ADD:3;COMMIT;']);
          commandSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          commandSource.on('end', (): void => {
            sink.end();
          });
          commandSource.resume();
        });
        expect(capturedCommittedTotal).assertEqual(5);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(1);
        expect(capturedRejectedCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(5);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_0900
     * @tc.name testStreamTransactionCommandFlow009
     * @tc.desc Verify a Readable-driven command source rejects UNKNOWN and still commits ADD:4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let commandSource = new ThirdBatchTextReadable(['BEGIN;UNKNOWN;ADD:4;', 'COMMIT;']);
          commandSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          commandSource.on('end', (): void => {
            sink.end();
          });
          commandSource.resume();
        });
        expect(capturedCommittedTotal).assertEqual(4);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(1);
        expect(capturedRejectedCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(4);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_1000
     * @tc.name testStreamTransactionCommandFlow010
     * @tc.desc Verify a Readable-driven nonnumeric ADD is rejected while ADD:3 commits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let commandSource = new ThirdBatchTextReadable(['BEGIN;ADD:x;', 'ADD:3;', 'COMMIT;']);
          commandSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          commandSource.on('end', (): void => {
            sink.end();
          });
          commandSource.resume();
        });
        expect(capturedCommittedTotal).assertEqual(3);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(1);
        expect(capturedRejectedCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(4);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_1100
     * @tc.name testStreamTransactionCommandFlow011
     * @tc.desc Verify a standalone empty command is rejected without pending residue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write(';', 'utf8');
          sink.end(undefined, 'utf8');
        });
        expect(capturedCommittedTotal).assertEqual(0);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedRejectedCount).assertEqual(1);
        expect(capturedCommandCount).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_1200
     * @tc.name testStreamTransactionCommandFlow012
     * @tc.desc Verify an incomplete final command remains pending after stream completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["BEGIN;ADD:5"];
          let sink = new TransactionCommandWritable();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          for (let index: int = 0; index < chunks.length - 1; index++) {
            sink.write(chunks[index], 'utf8');
          }
          sink.end(chunks[chunks.length - 1], 'utf8');
        });
        expect(capturedCommittedTotal).assertEqual(0);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertTrue();
        expect(capturedCommandCount).assertEqual(1);
        expect(capturedPending).assertEqual("ADD:5");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSACTION_COMMAND_FLOW_1300
     * @tc.name testStreamTransactionCommandFlow013
     * @tc.desc Verify corked event-driven commands isolate rejection counts across transactions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransactionCommandFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCommittedTotal: int = 0;
        let capturedWorkingTotal: int = 0;
        let capturedTransactionActive: boolean = false;
        let capturedCommitCount: int = 0;
        let capturedRollbackCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedCommandCount: int = 0;
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new TransactionCommandWritable();
          sink.cork();
          sink.on('finish', (): void => {
            capturedCommittedTotal = sink.committedTotal;
            capturedWorkingTotal = sink.workingTotal;
            capturedTransactionActive = sink.transactionActive;
            capturedCommitCount = sink.commitCount;
            capturedRollbackCount = sink.rollbackCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedCommandCount = sink.commandCount;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let commandSource = new ThirdBatchTextReadable([
            'ADD:9;BEGIN;ADD:4;',
            'BAD;COMMIT;ROLLBACK;',
            'BEGIN;ADD:-1;COMMIT;'
          ]);
          commandSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          commandSource.on('end', (): void => {
            sink.uncork();
            sink.end();
          });
          commandSource.resume();
        });
        expect(capturedCommittedTotal).assertEqual(3);
        expect(capturedWorkingTotal).assertEqual(0);
        expect(capturedTransactionActive).assertFalse();
        expect(capturedCommitCount).assertEqual(2);
        expect(capturedRejectedCount).assertEqual(3);
        expect(capturedCommandCount).assertEqual(9);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();

        done();
      });
  });
}
