'use static';
export { exportedAsyncFunc, exportedAsyncArrowFunc, ExportedTestClass } from './callbackWrapperExportModule';

export { exportedAsyncFunc as renamedAsyncFunc, ExportedTestClass as RenamedTestClass } from './callbackWrapperExportModule';

export * from './callbackWrapperExportModule';

export async function reexportedAsyncFunc(): Promise<string> {
  return 'reexported-async';
}

export class ReexportedTestClass {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethodAfterGetterSetter(): Promise<number> {
    return this._value + 200;
  }
}
