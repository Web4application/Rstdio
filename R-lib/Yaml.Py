import markdown
import yaml
import re

# ==========================================
# EXTRACT YAML FRONTMATTER
# ==========================================

def extract_frontmatter(text: str):
    """
    Extract YAML frontmatter like:
    ---
    title: Hello
    author: seriki yakub
    ---
    """

    match = re.match(r"^---(.*?)---(.*)$", text, re.DOTALL)

    if not match:
        return {}, text

    yaml_block = match.group(1).strip()
    content = match.group(2).strip()

    metadata = yaml.safe_load(yaml_block)

    return metadata, content

# ==========================================
# MDX VARIABLE REPLACEMENT
# ==========================================

def apply_mdx_variables(text: str, metadata: dict):

    def replacer(match):
        key = match.group(1)
        return str(metadata.get(key, f"{{{key}}}"))

    # supports {title}, {author}, etc
    return re.sub(r"\{(\w+)\}", replacer, text)

# ==========================================
# MAIN RENDER ENGINE
# ==========================================

def render_mdx(text: str):

    # 1. parse YAML
    metadata, markdown_text = extract_frontmatter(text)

    # 2. apply MDX-style variables
    markdown_text = apply_mdx_variables(markdown_text, metadata)

    # 3. convert markdown → HTML
    html = markdown.markdown(
        markdown_text,
        extensions=[
            "fenced_code",
            "tables",
            "codehilite"
        ]
    )

    return metadata, html

# ==========================================
# EXAMPLE USAGE
# ==========================================

if __name__ == "__main__":

    sample = """
---
title: Web4 AI System
author: seriki yakub
version: 1.0
---

# {title}

Created by {seriki yakub}

This is **MDX-style rendering** in Python.

## Features
- YAML metadata
- Markdown rendering
- Variable injection
"""

    meta, html = render_mdx(sample)

    print("METADATA:")
    print(meta)

    print("\nHTML OUTPUT:\n")
    print(html)
