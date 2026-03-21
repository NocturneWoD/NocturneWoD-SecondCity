import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureToggle,
  FeatureTriColorInput,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const has_snout: FeatureToggle = {
  name: 'Add Part: Snout',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds a snout to your character.
  `,
  component: CheckboxInput,
};

export const snout_color: Feature<string[]> = {
  name: 'Snout Color',
  component: FeatureTriColorInput,
};
