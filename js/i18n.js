import testi from '../lang/it.js';

export function t(chiave, vars = {}) {
  let v = chiave.split('.').reduce((o, k) => (o == null ? o : o[k]), testi);
  if (typeof v !== 'string') return chiave;
  return v.replace(/\{(\w+)\}/g, (_, k) => (k in vars ? vars[k] : `{${k}}`));
}

export function raw(chiave) {
  return chiave.split('.').reduce((o, k) => (o == null ? o : o[k]), testi);
}

export function applicaTesti(root = document) {
  root.querySelectorAll('[data-t]').forEach((el) => { el.textContent = t(el.dataset.t); });
}
