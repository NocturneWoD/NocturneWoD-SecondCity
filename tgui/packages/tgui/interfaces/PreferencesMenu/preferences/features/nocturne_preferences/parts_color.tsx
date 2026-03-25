import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureToggle,
  FeatureTriColorInput,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

// snouts

export const has_snout_nocturne: FeatureToggle = {
  name: 'Add Part: Snout',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds a snout to your character.
  `,
  component: CheckboxInput,
};

export const snout_nocturne_color: Feature<string[]> = {
  name: 'Snout Color',
  component: FeatureTriColorInput,
};

// ears

export const has_ears_nocturne: FeatureToggle = {
  name: 'Add Part: Ears',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds fancy ears to your character.
  `,
  component: CheckboxInput,
};

export const ears_nocturne_color: Feature<string[]> = {
  name: 'Ears Color',
  component: FeatureTriColorInput,
};

// fluff

export const has_fluff_nocturne: FeatureToggle = {
  name: 'Add Part: Fluff',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds fluff to your character.
  `,
  component: CheckboxInput,
};

export const fluff_nocturne_color: Feature<string[]> = {
  name: 'Fluff Color',
  component: FeatureTriColorInput,
};

// tail

export const has_tail_nocturne: FeatureToggle = {
  name: 'Add Part: Tail',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds a tail to your character.
  `,
  component: CheckboxInput,
};

export const tail_nocturne_color: Feature<string[]> = {
  name: 'Tail Color',
  component: FeatureTriColorInput,
};

// horns

export const has_horns_nocturne: FeatureToggle = {
  name: 'Add Part: Horns',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds horns to your character.
  `,
  component: CheckboxInput,
};

export const horns_nocturne_color: Feature<string[]> = {
  name: 'Horns Color',
  component: FeatureTriColorInput,
};

// frills

export const has_frills_nocturne: FeatureToggle = {
  name: 'Add Part: Frills',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds frills to your character.
  `,
  component: CheckboxInput,
};

export const frills_nocturne_color: Feature<string[]> = {
  name: 'Frills Color',
  component: FeatureTriColorInput,
};
