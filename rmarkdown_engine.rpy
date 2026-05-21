import re
import yaml
import markdown
import subprocess
import tempfile
import os

# ==========================================
# YAML FRONTMATTER PARSER
# ==========================================

def parse_yaml(text: str):

    match = re.match(r"^---(.*?)---(.*)$", text, re.DOTALL)

    if not match:
        return {}, text

    meta = yaml.safe_load(match.group(1))
    body = match.group(2).strip()

    return meta, body

# ==========================================
# EXECUTE PYTHON CODE BLOCKS
# ==========================================

def run_python(code: str) -> str:

    with tempfile.NamedTemporaryFile("w", suffix=".py", delete=False) as f:
        f.write(code)
        path = f.name

    result = subprocess.run(
        ["python", path],
        capture_output=True,
        text=True
    )

    os.remove(path)

    return result.stdout + result.stderr

# ==========================================
# EXECUTE R CODE BLOCKS (optional)
# ==========================================

def run_r(code: str) -> str:

    with tempfile.NamedTemporaryFile("w", suffix=".R", delete=False) as f:
        f.write(code)
        path = f.name

    result = subprocess.run(
        ["Rscript", path],
        capture_output=True,
        text=True
    )

    os.remove(path)

    return result.stdout + result.stderr

# ==========================================
# PARSE CODE BLOCKS
# ==========================================

def process_code_blocks(text: str):

    def replacer(match):

        lang = match.group(1)
        code = match.group(2)

        if lang == "python":
            output = run_python(code)
            return f"\n```python\n{code}\n```\n\n**Output:**\n```\n{output}\n```"

        elif lang == "r":
            output = run_r(code)
            return f"\n```r\n{code}\n```\n\n**Output:**\n```\n{output}\n```"

        else:
            return match.group(0)

    return re.sub(
        r"```(python|r)\n(.*?)```",
        replacer,
        text,
        flags=re.DOTALL
    )

# ==========================================
# MAIN RENDER ENGINE
# ==========================================

def render_rmarkdown(doc: str):

    # 1. YAML metadata
    meta, body = parse_yaml(doc)

    # 2. execute code blocks
    executed = process_code_blocks(body)

    # 3. markdown → HTML
    html = markdown.markdown(
        executed,
        extensions=["fenced_code", "tables"]
    )

    return meta, html

# ==========================================
# DEMO
# ==========================================

if __name__ == "__main__":

    sample = """
---
title: R + Python Report
author: RODA AI
---

# {title}

## Python Example

```python
print("Hello from Python")
