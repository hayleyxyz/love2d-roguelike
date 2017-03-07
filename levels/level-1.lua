return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 15,
  height = 14,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 17,
  properties = {},
  tilesets = {
    {
      name = "Tiles",
      firstgid = 1,
      filename = "../../../../Tilted/Tiles.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 10,
      tiles = {
        {
          id = 0,
          image = "../res/tiles/corner-1.png",
          width = 32,
          height = 32
        },
        {
          id = 1,
          image = "../res/tiles/corner-2.png",
          width = 32,
          height = 32
        },
        {
          id = 2,
          image = "../res/tiles/corner-3.png",
          width = 32,
          height = 32
        },
        {
          id = 3,
          image = "../res/tiles/corner-4.png",
          width = 32,
          height = 32
        },
        {
          id = 4,
          image = "../res/tiles/ground.png",
          width = 32,
          height = 32
        },
        {
          id = 5,
          image = "../res/tiles/wall.png",
          width = 32,
          height = 32
        },
        {
          id = 6,
          image = "../res/tiles/wall-1.png",
          width = 32,
          height = 32
        },
        {
          id = 7,
          image = "../res/tiles/wall-2.png",
          width = 32,
          height = 32
        },
        {
          id = 8,
          image = "../res/tiles/wall-3.png",
          width = 32,
          height = 32
        },
        {
          id = 9,
          image = "../res/tiles/wall-4.png",
          width = 32,
          height = 32
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "tiles",
      x = 0,
      y = 0,
      width = 15,
      height = 14,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        6, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 6,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 1, 7, 7, 7, 7, 6,
        8, 5, 1, 7, 7, 7, 2, 5, 5, 10, 6, 9, 9, 9, 6,
        8, 5, 10, 6, 9, 9, 3, 5, 5, 10, 8, 5, 5, 5, 10,
        8, 5, 10, 8, 5, 5, 5, 5, 5, 4, 3, 5, 5, 5, 10,
        8, 5, 4, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10,
        6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 6
      }
    },
    {
      type = "objectgroup",
      name = "wall",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 32,
          height = 448,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 416,
          width = 480,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 0,
          width = 32,
          height = 448,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 480,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 160,
          width = 64,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 160,
          width = 192,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 192,
          width = 160,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 192,
          width = 64,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
