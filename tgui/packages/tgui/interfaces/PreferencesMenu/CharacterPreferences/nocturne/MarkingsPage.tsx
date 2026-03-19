import { filter } from 'es-toolkit/compat';
import { useState } from 'react';

import { classes } from 'tgui-core/react';
import { Autofocus, Section, Button, Box, ColorBox, Flex, Floating, Input, Stack, TrackOutsideClicks } from 'tgui-core/components';
import { useBackend, useLocalState, useSharedState } from 'tgui/backend';
import {
    Marking,
    MarkingZone,
    type PreferencesMenuData,
  } from '../../types';
import { createSearch } from 'tgui-core/string';

const MARKING_CELL_SIZE = 48;
const MARKING_SIDEBAR_ROWS = 12;

const MARKING_SELECTION_CELL_SIZE = 48;
const MARKING_SELECTION_WIDTH = 5.4;
const MARKING_SELECTION_MULTIPLIER = 5.2;

type MarkingSelectionProps = {
  name: string;
  selected: string;
  onSelect: (value: string) => void;
};

function MarkingSelection(props: MarkingSelectionProps) {
  // const { catalog, supplementalFeature, supplementalValue } = props;
  const [searchText, setSearchText] = useState('');

  return (
    <Box
      className="ChoicedSelection"
      style={{
        height: `${
          MARKING_SELECTION_CELL_SIZE * MARKING_SELECTION_MULTIPLIER
        }px`,
        width: `${MARKING_SELECTION_CELL_SIZE * MARKING_SELECTION_WIDTH}px`,
      }}
    >
      <Stack fill vertical g={0}>
        <Stack.Item>
          <Section
            fill
            title={`Select ${props.name.toLowerCase()}`}
          >
            <Input
              autoFocus
              fluid
              placeholder="Search..."
              onChange={setSearchText}
            />
          </Section>
        </Stack.Item>
        <Stack.Item grow>
          <Section fill scrollable noTopPadding>

          </Section>
        </Stack.Item>
      </Stack>
    </Box>
  );
}

function searchInCatalog(searchText = '', catalog: Record<string, string>) {
  let items = Object.entries(catalog);
  if (searchText) {
    items = filter(
      items,
      createSearch(searchText, ([name, _icon]) => name),
    );
  }
  return items;
}

type MarkingButtonProps = {
  key: string;
  zone: MarkingZone;
  selected_marking: Marking;
};

const MarkingButton = (props: MarkingButtonProps) => {
  const { act, data } = useBackend<PreferencesMenuData>();
  return (
    <Button
      width="100%"
      content={props.selected_marking.name}
    />
  );
};

type MarkingInputProps = {
  zone: MarkingZone;
  marking: Marking;
};

const MarkingInput = (props: MarkingInputProps) => {
  const { act, data } = useBackend<PreferencesMenuData>();
  return (
    <Stack fill textAlign="center" verticalAlign="middle">
      <Stack.Item grow>
        <Button
          fluid
          onClick={() =>
            act('color_marking', {
              body_zone: props.zone.body_zone,
              marking_index: props.marking.marking_index,
            })
          }>
          <ColorBox
            style={{
              border: '2px solid white',
            }}
            color={props.marking.color}
          />
        </Button>
      </Stack.Item>
      <Stack.Item grow>
        <Button
          fluid
          icon="sort-up"
          onClick={() =>
            act('move_marking_up', {
              body_zone: props.zone.body_zone,
              marking_index: props.marking.marking_index,
            })
          }
        />
      </Stack.Item>
      <Stack.Item grow>
        <Button
          fluid
          icon="sort-down"
          onClick={() =>
            act('move_marking_down', {
              body_zone: props.zone.body_zone,
              marking_index: props.marking.marking_index,
            })
          }
        />
      </Stack.Item>
      <Stack.Item grow>
        <Button
          fluid
          icon="times"
          color="bad"
          onClick={() =>
            act('remove_marking', {
              body_zone: props.zone.body_zone,
              marking_index: props.marking.marking_index,
            })
          }
        />
      </Stack.Item>
    </Stack>
  );
};

type ZoneItemProps = {
  key: string;
  zone: MarkingZone;
};

const ZoneItem = (props: ZoneItemProps) => {
  const { act, data } = useBackend<PreferencesMenuData>();
  const maxmarkings = data.maximum_markings_per_limb;
  return (
    <Stack.Item>
      <Section
        title={
          props.zone.name + ' (' + props.zone.markings.length + '/' + maxmarkings + ')'
        }>
        <Stack vertical>
          <Stack.Item>
            {props.zone.markings.map((marking) => (
              <Stack key={marking.marking_index}>
                <Stack.Item width="50%" mb={1}>
                  <MarkingButton
                    key={props.key}
                    zone={props.zone}
                    selected_marking={marking}
                  />
                </Stack.Item>
                <Stack.Item width="50%">
                  <MarkingInput zone={props.zone} marking={marking} />
                </Stack.Item>
              </Stack>
            ))}
          </Stack.Item>
          <Stack.Item>
            {(!props.zone.cant_add_markings && (
              <Button
                icon="plus"
                color="good"
                onClick={() =>
                  act('add_marking', {
                    body_zone: props.zone.body_zone,
                  })
                }
              />
            )) || <Box>{props.zone.cant_add_markings}</Box>}
          </Stack.Item>
        </Stack>
      </Section>
    </Stack.Item>
  );
};


type MarkingsPageProps = {
  maxHeight: string;
};

export const MarkingsPage = (props: MarkingsPageProps) => {
  const { act, data } = useBackend<PreferencesMenuData>();
  const { maxHeight } = props;

  const markingslist: MarkingZone[] = [];
  markingslist.length = data.marking_parts.length;
  for (let index = 0; index < data.marking_parts.length; index++) {
    markingslist[index] = data.marking_parts[index];
  }
  const stacks: MarkingZone[][] = [];
  while (markingslist.length > 0) {
    stacks.push(markingslist.splice(0, 6));
  }

  return (
    <Stack.Item
      basis="50%"
      grow
      style={{
        background: 'rgba(0, 0, 0, 0.5)',
        padding: '4px',
      }}
      overflowX="hidden"
      overflowY="auto"
      maxHeight={maxHeight}
    >
      <Stack width="100%" height="100%">
        {stacks.map((stack, index) => (
          <Stack.Item grow key={index}>
            <Section overflowX="hidden" fill backgroundColor='rgba(0, 0, 0, 0.0)'>
              <Stack vertical>
                {stack.map((zone) => (
                  <ZoneItem
                    key={zone.body_zone}
                    zone={zone}
                  />
                ))}
              </Stack>
            </Section>
          </Stack.Item>
        ))}
      </Stack>
    </Stack.Item>
  );
};
