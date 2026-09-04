declare module 'libnapiBuffer.so' {
  export const isBuffer: () => boolean;
  export const isBufferAfterException: () => number;
  export const isBufferOnNonBuffer: () => number;
  export const isBufferOnSlice: () => number;
  export const createBufferAndVerify: () => number;
}
