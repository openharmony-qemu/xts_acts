// Non-shared module (A, module under test): references the shared module SharedB
// (A->B scenario). A non-shared module is loaded only once per thread, and once
// again for each new thread (one independent module object per thread): each load
// generates a unique aLoadMarker and records one entry in LoadRecorder.
// The marker embeds process.tid so that markers from different threads can never
// collide — a 50-round run showed that two same-millisecond loads on fresh worker
// isolates can draw identical Math.random() values.
import { process } from '@kit.ArkTS';
import { loadRecorder } from './LoadRecorder';
import { bLoadId } from './SharedB';

let aLoadMarker: string = `a-load-tid${process.tid}-${Date.now()}-${Math.floor(Math.random() * 1000000000)}`;

loadRecorder.recordLoad('NonSharedA');

// Load marker of this thread's A module object (unique per thread via tid)
export function getALoadMarker(): string {
  return aLoadMarker;
}

// Reads B's load marker through A's reference to B (verifies B stays globally
// unique through A)
export function getBLoadIdThroughA(): string {
  return bLoadId;
}
