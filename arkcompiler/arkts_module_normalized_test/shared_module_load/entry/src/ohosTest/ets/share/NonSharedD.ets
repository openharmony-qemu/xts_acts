// Non-shared module (D): referenced only by the shared module SharedC; test code
// never imports this module directly. Each load (once per thread, triggered by lazy
// loading) generates a unique dLoadMarker and records one entry in LoadRecorder.
// The marker embeds process.tid so that markers from different threads can never
// collide (see NonSharedA for details).
import { process } from '@kit.ArkTS';
import { loadRecorder } from './LoadRecorder';

let dLoadMarker: string = `d-load-tid${process.tid}-${Date.now()}-${Math.floor(Math.random() * 1000000000)}`;

loadRecorder.recordLoad('NonSharedD');

export function getDLoadMarker(): string {
  return dLoadMarker;
}
