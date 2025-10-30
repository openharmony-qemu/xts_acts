export interface PipeResult {
  readFd: number;
  writeFd: number;
}

export const createPipe: () => PipeResult;