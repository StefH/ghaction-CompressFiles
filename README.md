# ghaction-CompressFiles

A GitHub Action for compressing files using Brotli or GZip compression.

## Why

In case you deploy your Blazor Web on GitHub Pages are have modified some files (*.js or *.html) and want to recompress these, use this GitHub Action.

## Usage

### Inputs

#### `path` (required)

The path to find the files. Default this is `.`

#### `extensions`

A comma separated list from all the file-extensions you want to compress. Default this is set to `.js,.css,.html,.json`

#### `tools`

A comman separated list from the compresion utilities you want to use. Valid values are `brotli` and `gzip`. Default both are used.

#### `depth`

Maximum folder depth to process. Default this is set to `3`

### Example

``` yml
- name: CompressFiles
  uses: stefh/ghaction-CompressFiles@v1
  with:
    path: ${{ env.PUBLISH_DIR }}
    extensions: '.js,.css,.html'
    tools: 'brotli,gzip'
```