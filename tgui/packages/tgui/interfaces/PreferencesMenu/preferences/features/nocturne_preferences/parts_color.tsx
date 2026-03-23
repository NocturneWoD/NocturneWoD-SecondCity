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
