import { EventEmitter, Subscription } from 'expo-modules-core';
import ExpoExternalPurchaseModule from './ExpoExternalPurchaseModule';
const emitter = new EventEmitter(ExpoExternalPurchaseModule);

export type ExternalPurchaseEvent = {
  result: string;
}
export function addExternalPurchaseListener(listener: (event: ExternalPurchaseEvent) => void): Subscription {
  return emitter.addListener<ExternalPurchaseEvent>('onChangeExternalPurchase', listener);
}

// Az `canPresentAsync` függvény boolean értéket ad vissza
export async function canPresentAsync(): Promise<boolean> {
  // feltételezve, hogy a natív modul már boolean értéket ad vissza
  return await ExpoExternalPurchaseModule.canPresentAsync();
}

// Az `presentNoticeSheetAsync` függvény string értéket ad vissza
export async function presentNoticeSheetAsync(): Promise<string> {
  // feltételezve, hogy a natív modul már string értéket ad vissza
  return await ExpoExternalPurchaseModule.presentNoticeSheetAsync();
}