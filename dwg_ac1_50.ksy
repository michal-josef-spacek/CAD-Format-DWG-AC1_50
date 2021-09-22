meta:
  id: dwg_ac1_50
  title: AutoCAD drawing (AC1003)
  application: AutoCAD
  file-extension:
    - dwg
  license: CC0-1.0
  xref:
    justsolve: DWG
    pronom:
      fmt: 25
    mime:
      - application/x-dwg
      - image/vnd.dwg
    wikidata: Q27863113
  endian: le
seq:
  - id: header
    type: header
  - id: entities
    type: real_entities
    size: header.entities_end - header.entities_start
  - id: blocks
    type: block
    repeat: expr
    repeat-expr: header.number_of_table_blocks
  - id: layers
    type: layer
    repeat: expr
    repeat-expr: header.number_of_table_layers
  - id: styles
    type: style
    repeat: expr
    repeat-expr: header.number_of_table_styles
  - id: linetypes
    type: linetype
    repeat: expr
    repeat-expr: header.number_of_table_linetypes
  - id: views
    type: view
    repeat: expr
    repeat-expr: header.number_of_table_views
  - id: block_entities
    type: real_entities
    size: header.blocks_size
types:
  block:
    seq:
      - id: unknown1
        type: s1
      - id: block_name
        size: 31
        type: str
        encoding: ASCII
        terminator: 0x2e
      - id: u1
        type: s1
      - id: u2
        type: s1
      - id: u3
        type: s1
      - id: u4
        type: s1
      - id: u5
        type: s1
  header:
    seq:
      - id: magic
        contents: [0x41, 0x43, 0x31, 0x2e, 0x35, 0x30]
        doc: 0x0000-0x0005, $ACADVER
      - id: zeros
        size: 6
      - id: zero_one_or_three
        type: s1
      - id: version_major
        type: s2
      - id: version_minor
        type: s2
      - id: version_micro
        type: s2
      - id: dwg_version
        type: s1
      - id: entities_start
        type: s4
      - id: entities_end
        type: s4
      - id: blocks_start
        type: s4
      - id: blocks_size
        type: s2
      - id: unknown4a
        size: 2
      - id: blocks_end
        type: s4
      - id: unknown4b
        size: 2
      - id: unknown4c
        size: 2
      - id: block_table_item_size
        type: s2
      - id: number_of_table_blocks
        type: s2
      - id: unknown4e
        size: 2
      - id: block_table_begin
        type: u4
      - id: layer_table_item_size
        type: s2
      - id: number_of_table_layers
        type: s2
      - id: unknown4g
        size: 2
      - id: layer_table_begin
        type: u4
      - id: style_table_item_size
        type: s2
      - id: number_of_table_styles
        type: s2
      - id: unknown4i
        size: 2
      - id: style_table_begin
        type: u4
      - id: linetype_table_item_size
        type: s2
      - id: number_of_table_linetypes
        type: s2
      - id: unknown4k
        size: 2
      - id: linetype_table_begin
        type: u4
      - id: view_table_item_size
        type: s2
      - id: number_of_table_views
        type: s2
      - id: unknown4m
        size: 2
      - id: view_table_begin
        type: u4
      - id: insertion_base_x
        type: f8
        doc: 0x005e-0x0065, $INSBASE/10
      - id: insertion_base_y
        type: f8
        doc: 0x0066-0x006d, $INSBASE/20
      - id: insertion_base_z
        type: f8
        doc: 0x006e-0x0075
      - id: number_of_entities
        type: s2
        doc: 0x0076-0x0077
      - id: drawing_first_x
        type: f8
        doc: $EXTMIN/10
      - id: drawing_first_y
        type: f8
        doc: $EXTMIN/20
      - id: drawing_first_z
        type: f8
      - id: drawing_second_x
        type: f8
        doc: $EXTMAX/10
      - id: drawing_second_y
        type: f8
        doc: $EXTMAX/20
      - id: drawing_second_z
        type: f8
      - id: limits_min_x
        type: f8
        doc: 0x00a8-0x00af, $LIMMIN/10
      - id: limits_min_y
        type: f8
        doc: 0x00b0-0x00b7, $LIMMIN/20
      - id: limits_max_x
        type: f8
        doc: 0x00b8-0x00bf
      - id: limits_max_y
        type: f8
        doc: 0x00c0-0x00c7
      - id: view_ctrl_x
        type: f8
        doc: 0x00c8-0x00cf, $VIEWCTRL/10
      - id: view_ctrl_y
        type: f8
        doc: 0x00d0-0x00d7, $VIEWCTRL/20
      - id: view_ctrl_z
        type: f8
        doc: 0x00d8-0x00da
      - id: view_size
        type: f8
        doc: 0x00e0-0x00e7
      - id: snap
        type: s2
        doc: 0x00e8-0x00e9, $SNAPMODE
      - id: snap_resolution_x
        type: f8
        doc: 0x00ea-0x00f1, $SNAPUNIT/10
      - id: snap_resolution_y
        type: f8
        doc: 0x00f2-0x00f9, $SNAPUNIT/20
      - id: snap_base_x
        type: f8
        doc: 0x00fa-0x0101, $SNAPBASE/10
      - id: snap_base_y
        type: f8
        doc: 0x0102-0x0109, $SNAPBASE/20
      - id: snap_angle
        type: f8
        doc: 0x010a-0x0111, $SNAPANG
      - id: snap_style
        type: s2
        doc: 0x0112-0x0113, $SNAPSTYLE
      - id: snap_iso_pair
        type: s2
        doc: 0x0114-0x0115, $SNAPISOPAIR
        # TODO enum ISOPLAIN command
      - id: grid
        type: s2
        doc: 0x0116-0x0117, $GRIDMODE
      - id: grid_unit_x
        type: f8
        doc: 0x0118-0x011f, $GRIDUNIT/10
      - id: grid_unit_y
        type: f8
        doc: 0x0120-0x0127, $GRIDUNIT/20
      - id: ortho
        type: s2
        doc: 0x0128-0x0129, $ORTHOMODE
      - id: regen
        type: s2
        doc: 0x012a-0x012b, $REGENMODE
      - id: fill
        type: s2
        doc: 0x012c-0x012d, $FILLMODE
      - id: qtext
        type: s2
        doc: 0x012e-0x012f, $QTEXTMODE
      - id: drag
        type: s2
        doc: 0x0130-0x0131, $DRAGMODE
      - id: linetype_scale
        type: f8
        doc: 0x0132-0x0139, $LTSCALE
      - id: text_size
        type: f8
        doc: 0x013a-0x0141, $TEXTSIZE
      - id: trace_width
        type: f8
        doc: 0x0142-0x0149, $TRACEWID
      - id: current_layer
        type: s2
        doc: 0x014a-0x014b, $CLAYER
      - id: unknown6
        type: f8
        doc: 0x014c-0x0153
      - id: unknown7a
        size: 2
        doc: 0x0154-0x0155
      - id: unknown7b
        size: 2
        doc: 0x0156-0x0157
      - id: unknown7c
        size: 2
        doc: 0x0158-0x0159
      - id: unknown7d
        size: 2
        doc: 0x015a-0x015b
      - id: unknown8
        type: f8
        doc: 0x015c-0x0163
      - id: linear_units_format
        enum: unit_types
        type: s2
        doc: 0x0164-0x0165, $LUNITS
      - id: linear_units_precision
        type: s2
        doc: 0x0166-0x0167, $LUPREC
      - id: axis
        type: s2
        doc: 0x0168-0x0169, $AXISMODE
      - id: axis_value_x
        type: f8
        doc: 0x016a-0x171, $AXISUNIT/10
      - id: axis_value_y
        type: f8
        doc: 0x0172-0x0179, $AXISUNIT/20
      - id: sketch_increment
        type: f8
        doc: 0x017a-0x0181, $SKETCHINC
      - id: fillet_radius
        type: f8
        doc: $FILETRAD
      - id: units_for_angles
        enum: units_for_angles
        type: s2
        doc: $AUNITS
      - id: angular_precision
        type: s2
        doc: $AUPREC
      - id: text_style
        type: s2
        doc: 0x018e-0x018f, $TEXTSTYLE (index)
      - id: osnap
        enum: osnap_modes
        type: s2
        doc: 0x0190-0x0191, $OSMODE
      - id: attributes
        enum: attributes
        type: s2
        doc: 0x0192-0x0193, $ATTMODE
      - id: menu
        size: 15
        type: str
        encoding: ASCII
        doc: $MENU
      - id: dim_scale
        type: f8
        doc: $DIMSCALE
      - id: dim_arrowhead_size
        type: f8
        doc: $DIMASZ
      - id: dim_extension_line_offset
        type: f8
        doc: $DIMEXO
      - id: dim_baseline_spacing
        type: f8
        doc: $DIMDLI
      - id: dim_extension_line_extend
        type: f8
        doc: $DIMEXE
      - id: dim_maximum_tolerance_limit
        type: f8
        doc: 0x01cb-0x01d2, $DIMTP
      - id: dim_minimum_tolerance_limit
        type: f8
        doc: 0x01d3-0x01da, $DIMTM
      - id: dim_text_height
        type: f8
        doc: 0x01db-0x01e2, $DIMTXT
      - id: dim_center_mark_control
        type: f8
        doc: 0x01e3-0x01ea, $DIMCEN
      - id: dim_oblique_stroke_size
        type: f8
        doc: 0x01eb-0x01f2, $DIMTSZ
      - id: dim_tolerances
        type: s1
        doc: 0x01f3, $DIMTOL
      - id: dim_limits_default_text
        type: s1
        doc: 0x01f4, $DIMLIM
      - id: dim_text_ext_inside_line_position
        type: s1
        doc: 0x01f5, $DIMTIH
      - id: dim_text_ext_outside_line_position
        type: s1
        doc: 0x01f6, $DIMTOH
      - id: dim_extension_line_first_suppress
        type: s1
        doc: 0x01f7, $DIMSE1
      - id: dim_extension_line_second_suppress
        type: s1
        doc: 0x01f8, $DIMSE2
      - id: dim_text_vertical_position
        type: s1
        doc: 0x01f9, $DIMTAD
      - id: ufo
        size: 235
        if: version_micro == 83
  entity:
    seq:
      - id: entity_type
        type: s1
        enum: entities
      - id: data
        type:
          switch-on: entity_type
          cases:
            'entities::arc': entity_arc
            'entities::attdef': entity_attdef
            'entities::attrib': entity_attrib
            'entities::block_begin': entity_block_begin
            'entities::block_end': entity_block_end
            'entities::insert' : entity_insert
            'entities::circle': entity_circle
            'entities::dim': entity_dim
            'entities::face3d': entity_face3d
            'entities::line': entity_line
            'entities::line3d': entity_line3d
            'entities::point': entity_point
            'entities::polyline': entity_polyline
            'entities::polyline2': entity_polyline
            'entities::repeat_begin': entity_repeat_begin
            'entities::repeat_end': entity_repeat_end
            'entities::seqend': entity_seqend
            'entities::shape': entity_shape
            'entities::solid': entity_solid
            'entities::text': entity_text
            'entities::trace': entity_trace
            'entities::vertex': entity_vertex
            _: entity_tmp
  entity_mode:
    seq:
      - id: entity_mode1
        type: b1
      - id: entity_mode2
        type: b1
      - id: entity_mode3
        type: b1
      - id: entity_mode4
        type: b1
      - id: entity_thickness_flag
        type: b1
      - id: entity_elevation_flag
        type: b1
      - id: entity_linetype_flag
        type: b1
      - id: entity_color_flag
        type: b1
  entity_common:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s1
      - id: flag1
        type: s1
      - id: flag2_1
        type: b1
      - id: flag2_2
        type: b1
      - id: flag2_3
        type: b1
      - id: flag2_4
        type: b1
      - id: flag2_5
        type: b1
      - id: flag2_6
        type: b1
      - id: flag2_7
        type: b1
      - id: flag2_8
        type: b1
      - id: flag3_1
        type: b1
      - id: flag3_2
        type: b1
      - id: flag3_3
        type: b1
      - id: flag3_4
        type: b1
      - id: flag3_5
        type: b1
      - id: flag3_6
        type: b1
      - id: flag3_7
        type: b1
      - id: flag3_8
        type: b1
      - id: entity_color
        type: s1
        if: entity_mode.entity_color_flag
      - id: entity_linetype_index
        type: s1
        if: entity_mode.entity_linetype_flag
      - id: entity_elevation
        type: f8
        if: entity_mode.entity_elevation_flag
      - id: entity_thickness
        type: f8
        if: entity_mode.entity_thickness_flag
  entity_arc:
    seq:
      - id: entity_common
        type: entity_common
      - id: x
        type: f8
        doc: ARC/10
      - id: y
        type: f8
        doc: ARC/20
      - id: radius
        type: f8
        doc: ARC/40
      - id: angle_from
        type: f8
        doc: ARC/50
      - id: angle_to
        type: f8
        doc: ARC/51
  entity_attdef:
    seq:
      - id: entity_common
        type: entity_common
      - id: start_point_x
        type: f8
        doc: ATTDEF/10
      - id: start_point_y
        type: f8
        doc: ATTDEF/20
      - id: height
        type: f8
        doc: ATTDEF/40
      - id: default_size
        type: s2
      - id: default
        size: default_size
        doc: ATTDEF/1
      - id: prompt_size
        type: s2
      - id: prompt
        size: prompt_size
        doc: ATTDEF/3
      - id: tag_size
        type: s2
      - id: tag
        size: tag_size
        doc: ATTDEF/2
      - id: flags
        type: attdef_flags
        doc: ATTDEF/70
      - id: rotation_angle_in_radians
        type: f8
        if: entity_common.flag2_7
        doc: ATTDEF/50
      - id: width_scale_factor
        type: f8
        if: entity_common.flag2_6
        doc: ATTDEF/41
      - id: unknown_index
        type: u1
        if: entity_common.flag2_4
      - id: flags2
        type: attdef_flags2
        if: entity_common.flag2_2
        doc: ATTDEF/72
      - id: end_point_x
        type: f8
        if: entity_common.flag2_1
        doc: ATTDEF/11
      - id: end_point_y
        type: f8
        if: entity_common.flag2_1
        doc: ATTDEF/21
  entity_attrib:
    seq:
      - id: entity_common
        type: entity_common
      - id: u1
        type: f8
      - id: u2
        type: f8
      - id: u3
        type: f8
      - id: size
        type: s2
      - id: text
        size: size
      - id: size2
        type: s2
      - id: text2
        size: size2
      - id: u4
        size: 1
      - id: u5
        type: f8
        if: entity_common.flag2_7
      - id: u6
        type: u1
        if: entity_common.flag2_2
        # 1, 2 nebo 7?
      - id: u7
        type: f8
        if: entity_common.flag2_1
      - id: u8
        type: f8
        if: entity_common.flag2_1
  entity_block_begin:
    seq:
      - id: entity_common
        type: entity_common
      - id: x
        type: f8
      - id: y
        type: f8
  entity_block_end:
    seq:
      - id: entity_common
        type: entity_common
  entity_insert:
    seq:
      - id: entity_common
        type: entity_common
      - id: block_index
        type: s2
        doc: INSERT/2
      - id: x
        type: f8
        doc: INSERT/10
      - id: y
        type: f8
        doc: INSERT/20
      - id: x_scale
        type: f8
        if: entity_common.flag2_8
        doc: INSERT/41
      - id: y_scale
        type: f8
        if: entity_common.flag2_7
        doc: INSERT/42
      - id: rotation_angle_in_radians
        type: f8
        if: entity_common.flag2_6
        doc: INSERT/50
      - id: z_scale
        type: f8
        if: entity_common.flag2_5
        doc: INSERT/43
      - id: columns
        type: u2
        if: entity_common.flag2_4
        doc: INSERT/70
      - id: rows
        type: u2
        if: entity_common.flag2_3
        doc: INSERT/71
      - id: column_spacing
        type: f8
        if: entity_common.flag2_2
        doc: INSERT/44
      - id: row_spacing
        type: f8
        if: entity_common.flag2_1
        doc: INSERT/45
  entity_circle:
    seq:
      - id: entity_common
        type: entity_common
      - id: x
        type: f8
        doc: CIRCLE/10
      - id: y
        type: f8
        doc: CIRCLE/20
      - id: radius
        type: f8
        doc: CIRCLE/40
  entity_dim:
    seq:
      - id: entity_common
        type: entity_common
      - id: block_index
        type: s2
      - id: dimension_line_defining_point_x
        type: f8
        doc: DIMENSION/10
      - id: dimension_line_defining_point_y
        type: f8
        doc: DIMENSION/20
      - id: default_text_position_x
        type: f8
        doc: DIMENSION/11
      - id: default_text_position_y
        type: f8
        doc: DIMENSION/21
      - id: unknown1
        type: u1
        if: entity_common.flag2_7
        doc: DIMENSION/70
      - id: text_size
        type: s2
        if: entity_common.flag2_6
      - id: text
        size: text_size
        if: entity_common.flag2_6
        doc: DIMENSION/1
      - id: extension_defining_point1_x
        type: f8
        if: entity_common.flag2_5
        doc: DIMENSION/13
      - id: extension_defining_point1_y
        type: f8
        if: entity_common.flag2_5
        doc: DIMENSION/23
      - id: extension_defining_point2_x
        type: f8
        if: entity_common.flag2_4
        doc: DIMENSION/14
      - id: extension_defining_point2_y
        type: f8
        if: entity_common.flag2_4
        doc: DIMENSION/24
      - id: defining_point_x
        type: f8
        if: entity_common.flag2_3
        doc: DIMENSION/15
      - id: defining_point_y
        type: f8
        if: entity_common.flag2_3
        doc: DIMENSION/25
      - id: dimension_line_arc_definition_point_x
        type: f8
        if: entity_common.flag2_2
      - id: dimension_line_arc_definition_point_y
        type: f8
        if: entity_common.flag2_2
      - id: rotation_in_radians
        type: f8
        if: entity_common.flag3_8
  entity_face3d:
    seq:
      - id: entity_common
        type: entity_common
  entity_line:
    seq:
      - id: entity_common
        type: entity_common
      - id: x1
        type: f8
        doc: LINE/10
      - id: y1
        type: f8
        doc: LINE/20
      - id: x2
        type: f8
        doc: LINE/11
      - id: y2
        type: f8
        doc: LINE/21
  entity_line3d:
    seq:
      - id: entity_common
        type: entity_common
      - id: x1
        type: f8
        doc: 3DLINE/10
      - id: y1
        type: f8
        doc: 3DLINE/20
      - id: z1
        type: f8
        if: entity_common.flag2_8
        doc: 3DLINE/30
      - id: x2
        type: f8
        doc: 3DLINE/11
      - id: y2
        type: f8
        doc: 3DLINE/21
      - id: z2
        type: f8
        if: entity_common.flag2_7
        doc: 3DLINE/31
  entity_tmp:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: xxx
        size: entity_size - 4
  entity_point:
    seq:
      - id: entity_common
        type: entity_common
      - id: x
        type: f8
        doc: POINT/10
      - id: y
        type: f8
        doc: POINT/20
  entity_polyline:
    seq:
      - id: entity_common
        type: entity_common
      - id: closed
        type: u1
        if: entity_common.flag2_8
        doc: POLYLINE/66
      - id: x
        type: f8
        if: entity_common.flag2_7
        doc: POLYLINE/40
      - id: y
        type: f8
        if: entity_common.flag2_6
        doc: POLYLINE/41
  entity_repeat_begin:
    seq:
      - id: entity_common
        type: entity_common
  entity_repeat_end:
    seq:
      - id: entity_common
        type: entity_common
      - id: columns
        type: s2
        doc: ENDREP/70
      - id: rows
        type: s2
        doc: ENDREP/71
      - id: x
        type: f8
        doc: ENDREP/40
      - id: y
        type: f8
        doc: ENDREP/41
  entity_seqend:
    seq:
      - id: entity_common
        type: entity_common
      - id: unknown
        size: 4
  entity_shape:
    seq:
      - id: entity_common
        type: entity_common
      - id: x
        type: f8
      - id: y
        type: f8
      - id: height
        type: f8
      - id: item_num
        type: u1
      - id: angle
        type: f8
        if: entity_common.flag2_8
      - id: load_num
        type: u1
  entity_solid:
    seq:
      - id: entity_common
        type: entity_common
      - id: from_x
        type: f8
      - id: from_y
        type: f8
      - id: from_and_x
        type: f8
      - id: from_and_y
        type: f8
      - id: to_x
        type: f8
      - id: to_y
        type: f8
      - id: to_and_x
        type: f8
      - id: to_and_y
        type: f8
  entity_text:
    seq:
      - id: entity_common
        type: entity_common
      - id: x
        type: f8
      - id: y
        type: f8
      - id: height
        type: f8
      - id: size
        type: s2
      - id: value
        size: size
      - id: angle
        type: f8
        if: entity_common.flag2_8
      - id: foo1
        type: u1
        if: entity_common.flag2_2
      - id: foo2
        type: f8
        if: entity_common.flag2_3
      - id: foo3
        type: f8
        if: entity_common.flag2_3
  entity_trace:
    seq:
      - id: entity_common
        type: entity_common
      - id: from_x
        type: f8
      - id: from_y
        type: f8
      - id: from_and_x
        type: f8
      - id: from_and_y
        type: f8
      - id: to_x
        type: f8
      - id: to_y
        type: f8
      - id: to_and_x
        type: f8
      - id: to_and_y
        type: f8
  entity_vertex:
    seq:
      - id: entity_common
        type: entity_common
      - id: x
        type: f8
        doc: VERTEX/10
      - id: y
        type: f8
        doc: VERTEX/20
      - id: width
        type: f8
        if: entity_common.flag2_8
      - id: bulge
        type: f8
        if: entity_common.flag2_6
        doc: VERTEX/42
      - id: unknown_in_radians
        type: f8
        if: entity_common.flag2_4
        doc: VERTEX/50
  attdef_flags:
    seq:
      - id: flag_1
        type: b1
      - id: flag_2
        type: b1
      - id: flag_3
        type: b1
      - id: flag_4
        type: b1
      - id: flag_5
        type: b1
      - id: invisible
        type: b1
      - id: constant
        type: b1
      - id: verify
        type: b1
  attdef_flags2:
    seq:
## TODO Tohle je divne
      - id: flag_1
        type: b1
      - id: flag_2
        type: b1
      - id: flag_3
        type: b1
      - id: flag_4
        type: b1
      - id: flag_5
        type: b1
      - id: middle
        type: b1
      - id: right
        type: b1
      - id: center
        type: b1
  layer:
    seq:
      - id: frozen
        type: s1
        doc: LAYER/70
      - id: layer_name
        size: 31
        type: str
        encoding: ASCII
        terminator: 0x2e
        doc: LAYER/2
      - id: unknown1
        type: s1
      - id: color
        type: s1
        doc: LAYER/62
      - id: unknown2
        type: s1
      - id: linetype_index
        type: s1
        doc: LAYER/6
      - id: unknown3
        type: s1
      - id: unknown4
        type: s1
        if: _root.header.version_micro == 74
  linetype:
    seq:
      - id: u2
        type: u1
        doc: LTYPE/70
      - id: linetype_name
        size: 31
        type: str
        encoding: ASCII
        terminator: 0x2e
        doc: LTYPE/2
      - id: u3
        type: u1
      - id: description
        size: 44
        type: str
        encoding: ASCII
        terminator: 0x2e
        doc: LTYPE/3
      - id: u5
        size: 4
      - id: alignment
        type: u1
        doc: LTYPE/72
      - id: num_dashes
        type: u1
        doc: LTYPE/73
      - id: pattern_len
        type: f8
        doc: LTYPE/40
      - id: u9
        type: f8
        doc: LTYPE/49
      - id: u10
        type: f8
        doc: LTYPE/49
      - id: u11
        type: f8
        doc: LTYPE/49
      - id: u12
        type: f8
        doc: LTYPE/49
      - id: u13
        type: f8
        doc: LTYPE/49
      - id: u14
        type: f8
        doc: LTYPE/49
      - id: u15
        type: f8
        doc: LTYPE/49
      - id: u16
        type: f8
        doc: LTYPE/49
      - id: u17
        type: f8
        doc: LTYPE/49
      - id: u18
        type: f8
        doc: LTYPE/49
      - id: u19
        type: f8
        doc: LTYPE/49
      - id: u20
        type: f8
        doc: LTYPE/49
      - id: unknown1
        type: s1
        if: _root.header.version_micro == 74
  real_entities:
    seq:
      - id: entities
        type: entity
        repeat: eos
  style:
    seq:
      - id: flag1_1
        type: b1
      - id: flag1_2
        type: b1
      - id: flag1_3
        type: b1
      - id: flag1_4
        type: b1
      - id: flag1_5
        type: b1
      - id: flag1_vertical
        type: b1
      - id: flag1_7
        type: b1
      - id: flag1_8
        type: b1
      - id: text
        size: 31
        type: str
        encoding: ASCII
        terminator: 0x2e
      - id: height
        type: f8
        doc: STYLE/40
      - id: unknown1
        type: u1
      - id: width_factor
        type: f8
        doc: STYLE/41
      - id: obliquing_angle_in_radians
        type: f8
        doc: STYLE/50
      - id: flag2_1
        type: b1
        doc: STYLE/71
      - id: flag2_2
        type: b1
      - id: flag2_3
        type: b1
      - id: flag2_4
        type: b1
      - id: flag2_5
        type: b1
      - id: flag2_upside_down
        type: b1
      - id: flag2_backwards
        type: b1
      - id: flag2_8
        type: b1
      - id: u12
        type: f8
        doc: STYLE/42
      - id: font_file
        size: 64
  view:
    seq:
      - id: u1
        type: u1
      - id: view_name
        size: 31
        type: str
        encoding: ASCII
        terminator: 0x2e
      - id: u2
        type: u1
      - id: view_size
        type: f8
        doc: VIEW/40
      - id: center_point_x
        type: f8
        doc: VIEW/10
      - id: center_point_y
        type: f8
        doc: VIEW/20
      - id: view_width
        type: f8
        doc: VIEW/41
      - id: u7
        type: u1
        if: _root.header.version_micro == 74
      - id: u3
        type: f8
        if: _root.header.version_micro == 83
      - id: u4
        type: f8
        if: _root.header.version_micro == 83
      - id: u5
        type: f8
        if: _root.header.version_micro == 83
      - id: u6
        type: u2
        if: _root.header.version_micro == 83
enums:
  entities:
    1: line
    2: point
    3: circle
    4: shape
    5: repeat_begin
    6: repeat_end
    7: text
    8: arc
    9: trace
    # NOT_USED 10: load
    11: solid
    12: block_begin
    13: block_end
    14: insert
    15: attdef
    16: attrib
    17: seqend
    18: polyline
    19: polyline2
    20: vertex
    21: line3d
    22: face3d
    23: dim
  osnap_modes:
    0: none
    1: endpoint
    2: midpoint
    4: center
    8: node
    16: quadrant
    32: intersection
    64: insertion
    128: perpendicular
    256: tangent
    512: nearest
  unit_types:
    1: scientific
    2: decimal
    3: engineering
    4: architectural
    5: fractional
  units_for_angles:
    0: decimal_degrees
    1: degrees_minutes_seconds
    2: gradians
    3: radians
    4: surveyor_s_units
  angle_direction:
    0: counterclockwise
    1: clockwise
  limits_check:
    0: objects_can_outside_grid
    1: objects_cannot_outside_grid
  coordinates:
    0: absolute_coordinates
    1: absolute_coordinates_realtime
    2: relative_polar_coordinates
  attributes:
    0: off
    1: normal
    2: on
  current_color:
    0: byblock
    1: red
    2: yellow
    3: green
    4: cyan
    5: blue
    6: magenta
    7: white
    256: bylayer
