import ExpoExternalPurchaseModule from './ExpoExternalPurchaseModule';

export type onChangeExternalPurchase = {
  result: string;
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