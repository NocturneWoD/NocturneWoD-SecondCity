import {
    Feature,
    FeatureChoiced,
    FeatureChoicedServerData,
    FeatureColorInput,
    FeatureValueProps,
  } from '../base';
  import { FeatureDropdownInput } from '../dropdowns';

  const zwsp: String = '\u200B'; // forbidden f-list technology
  const zwnj: String = '\u200C';

  export const markings_head: FeatureChoiced = {
    name: `${zwnj.repeat(1)}${zwsp.repeat(1)}Head Markings`,
    description: `
    Add a suitable marking to your character's head.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_head_color: Feature<string> = {
    name: `${zwnj.repeat(1)}${zwsp.repeat(2)}Head Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_head2: FeatureChoiced = {
    name: `${zwnj.repeat(1)}${zwsp.repeat(3)}Head Markings 2`,
    description: `
    Add a suitable marking to your character's head.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_head_color2: Feature<string> = {
    name: `${zwnj.repeat(1)}${zwsp.repeat(4)}Head Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_head3: FeatureChoiced = {
    name: `${zwnj.repeat(1)}${zwsp.repeat(5)}Head Markings 3`,
    description: `
    Add a suitable marking to your character's head.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_head_color3: Feature<string> = {
    name: `${zwnj.repeat(1)}${zwsp.repeat(6)}Head Markings Color 3`,
    component: FeatureColorInput,
  };

  export const markings_chest: FeatureChoiced = {
    name: `${zwnj.repeat(2)}${zwsp.repeat(1)}Chest Markings`,
    description: `
    Add a suitable marking to your character's chest.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_chest_color: Feature<string> = {
    name: `${zwnj.repeat(2)}${zwsp.repeat(2)}Chest Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_chest2: FeatureChoiced = {
    name: `${zwnj.repeat(2)}${zwsp.repeat(3)}Chest Markings 2`,
    description: `
    Add a suitable marking to your character's chest.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_chest_color2: Feature<string> = {
    name: `${zwnj.repeat(2)}${zwsp.repeat(4)}Chest Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_chest3: FeatureChoiced = {
    name: `${zwnj.repeat(2)}${zwsp.repeat(5)}Chest Markings 3`,
    description: `
    Add a suitable marking to your character's chest.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_chest_color3: Feature<string> = {
    name: `${zwnj.repeat(2)}${zwsp.repeat(6)}Chest Markings Color 3`,
    component: FeatureColorInput,
  };

  export const markings_l_arm: FeatureChoiced = {
    name: `${zwnj.repeat(3)}${zwsp.repeat(1)}Left Arm Markings`,
    description: `
    Add a suitable marking to your character's left arm.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_arm_color: Feature<string> = {
    name: `${zwnj.repeat(3)}${zwsp.repeat(2)}Left Arm Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_l_arm2: FeatureChoiced = {
    name: `${zwnj.repeat(3)}${zwsp.repeat(3)}Left Arm Markings 2`,
    description: `
    Add a suitable marking to your character's left arm.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_arm_color2: Feature<string> = {
    name: `${zwnj.repeat(3)}${zwsp.repeat(4)}Left Arm Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_l_arm3: FeatureChoiced = {
    name: `${zwnj.repeat(3)}${zwsp.repeat(5)}Left Arm Markings 3`,
    description: `
    Add a suitable marking to your character's l_arm.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_arm_color3: Feature<string> = {
    name: `${zwnj.repeat(3)}${zwsp.repeat(6)}Left Arm Markings Color 3`,
    component: FeatureColorInput,
  };

  export const markings_r_arm: FeatureChoiced = {
    name: `${zwnj.repeat(4)}${zwsp.repeat(1)}Right Arm Markings`,
    description: `
    Add a suitable marking to your character's right arm.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_arm_color: Feature<string> = {
    name: `${zwnj.repeat(4)}${zwsp.repeat(2)}Right Arm Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_r_arm2: FeatureChoiced = {
    name: `${zwnj.repeat(4)}${zwsp.repeat(3)}Right Arm Markings 2`,
    description: `
    Add a suitable marking to your character's right arm.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_arm_color2: Feature<string> = {
    name: `${zwnj.repeat(4)}${zwsp.repeat(4)}Right Arm Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_r_arm3: FeatureChoiced = {
    name: `${zwnj.repeat(4)}${zwsp.repeat(5)}Right Arm Markings 3`,
    description: `
    Add a suitable marking to your character's right arm.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_arm_color3: Feature<string> = {
    name: `${zwnj.repeat(4)}${zwsp.repeat(6)}Right Arm Markings Color 3`,
    component: FeatureColorInput,
  };

  export const markings_l_hand: FeatureChoiced = {
    name: `${zwnj.repeat(5)}${zwsp.repeat(1)}Left Hand Markings`,
    description: `
    Add a suitable marking to your character's left hand.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_hand_color: Feature<string> = {
    name: `${zwnj.repeat(5)}${zwsp.repeat(2)}Left Hand Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_l_hand2: FeatureChoiced = {
    name: `${zwnj.repeat(5)}${zwsp.repeat(3)}Left Hand Markings 2`,
    description: `
    Add a suitable marking to your character's left hand.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_hand_color2: Feature<string> = {
    name: `${zwnj.repeat(5)}${zwsp.repeat(4)}Left Hand Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_l_hand3: FeatureChoiced = {
    name: `${zwnj.repeat(5)}${zwsp.repeat(5)}Left Hand Markings 3`,
    description: `
    Add a suitable marking to your character's left hand.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_hand_color3: Feature<string> = {
    name: `${zwnj.repeat(5)}${zwsp.repeat(6)}Left Hand Markings Color 3`,
    component: FeatureColorInput,
  };

  export const markings_r_hand: FeatureChoiced = {
    name: `${zwnj.repeat(6)}${zwsp.repeat(1)}Right Hand Markings`,
    description: `
    Add a suitable marking to your character's right hand.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_hand_color: Feature<string> = {
    name: `${zwnj.repeat(6)}${zwsp.repeat(2)}Right Hand Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_r_hand2: FeatureChoiced = {
    name: `${zwnj.repeat(6)}${zwsp.repeat(3)}Right Hand Markings 2`,
    description: `
    Add a suitable marking to your character's right hand.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_hand_color2: Feature<string> = {
    name: `${zwnj.repeat(6)}${zwsp.repeat(4)}Right Hand Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_r_hand3: FeatureChoiced = {
    name: `${zwnj.repeat(6)}${zwsp.repeat(5)}Right Hand Markings 3`,
    description: `
    Add a suitable marking to your character's right hand.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_hand_color3: Feature<string> = {
    name: `${zwnj.repeat(6)}${zwsp.repeat(6)}Right Hand Markings Color 3`,
    component: FeatureColorInput,
  };

  export const markings_l_leg: FeatureChoiced = {
    name: `${zwnj.repeat(7)}${zwsp.repeat(1)}Left Leg Markings`,
    description: `
    Add a suitable marking to your character's left leg.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_leg_color: Feature<string> = {
    name: `${zwnj.repeat(7)}${zwsp.repeat(2)}Left Leg Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_l_leg2: FeatureChoiced = {
    name: `${zwnj.repeat(7)}${zwsp.repeat(3)}Left Leg Markings 2`,
    description: `
    Add a suitable marking to your character's left leg.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_leg_color2: Feature<string> = {
    name: `${zwnj.repeat(7)}${zwsp.repeat(4)}Left Leg Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_l_leg3: FeatureChoiced = {
    name: `${zwnj.repeat(7)}${zwsp.repeat(5)}Left Leg Markings 3`,
    description: `
    Add a suitable marking to your character's left leg.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_l_leg_color3: Feature<string> = {
    name: `${zwnj.repeat(7)}${zwsp.repeat(6)}Left Leg Markings Color 3`,
    component: FeatureColorInput,
  };

  export const markings_r_leg: FeatureChoiced = {
    name: `${zwnj.repeat(8)}${zwsp.repeat(1)}Right Leg Markings`,
    description: `
    Add a suitable marking to your character's right leg.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_leg_color: Feature<string> = {
    name: `${zwnj.repeat(8)}${zwsp.repeat(2)}Right Leg Markings Color`,
    component: FeatureColorInput,
  };

  export const markings_r_leg2: FeatureChoiced = {
    name: `${zwnj.repeat(8)}${zwsp.repeat(3)}Right Leg Markings 2`,
    description: `
    Add a suitable marking to your character's right leg.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_leg_color2: Feature<string> = {
    name: `${zwnj.repeat(8)}${zwsp.repeat(4)}Right Leg Markings Color 2`,
    component: FeatureColorInput,
  };

  export const markings_r_leg3: FeatureChoiced = {
    name: `${zwnj.repeat(8)}${zwsp.repeat(5)}Right Leg Markings 3`,
    description: `
    Add a suitable marking to your character's right leg.
    `,
    component: (
      props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    ) => {
      return <FeatureDropdownInput buttons {...props} />;
    },
  };

  export const markings_r_leg_color3: Feature<string> = {
    name: `${zwnj.repeat(8)}${zwsp.repeat(6)}Right Leg Markings Color 3`,
    component: FeatureColorInput,
  };
