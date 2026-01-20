# Image Vector Search

> **Note:** This training material is now outdated. Newer, more capable models like CLIP-ViT-L-14, OpenCLIP, and SigLIP2 are available. The solution is already implemented in this codebase.

A Rails application demonstrating image similarity search using CLIP embeddings and vector databases.

## Solution Overview

The implementation uses:
- **CLIP (ViT-B-32)** - for generating image embeddings via ONNX Runtime
- **M-CLIP (XLM-Roberta-Large)** - for multilingual text embeddings, enabling search in any language
- **sqlite-vec** - SQLite extension for vector similarity search
- **neighbor** - Rails gem for vector search integration

### Key Components

- `CLIP::ImageEmbedding` - Preprocesses images and generates 512-dimensional embeddings
- `CLIP::TextEmbedding` - Tokenizes text and generates embeddings for text-to-image search
- `Photo` model - Stores images with their embeddings, supports similarity search via `#similar` and `.by_description`
- `EmbedPhotoJob` - Background job for generating embeddings asynchronously

## Requirements

- Ruby 3.3.10
- ImageMagick
- [git-lfs](https://git-lfs.com/)

## Installation

Install [git-lfs](https://git-lfs.com/), clone with recurse submodules to get the models and test data:

```bash
git clone --recurse-submodules git@github.com:khasinski/image-vector-search.git
```

If you have already cloned the repository, you can run the following command to get the submodules:

```bash
git submodule update --init --recursive
```

Install the gems, setup the database and start the server:

```bash
bundle install
rails db:setup
rails s
```

## Usage

```ruby
# Find similar images
photo = Photo.first
photo.similar.limit(5)

# Search by text description (supports any language)
Photo.by_description("a cat sitting on a couch")
Photo.by_description("un chat assis sur un canape")

# Search by image
Photo.by_image(uploaded_file)
```
