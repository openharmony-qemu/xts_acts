export const BIND_ERROR_CODE: number = 10200011;
export const CONCURRENT_ERROR_CODE: number = 10200201;


@Sendable
export class CrossThreadMapResult {
  public containsValueResult: boolean = false;
  public putOldValue: string = '';
  public removeOldValue: string = '';
  public finalSize: number = 0;
}