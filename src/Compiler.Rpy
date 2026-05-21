import re
import yaml
import markdown
import subprocess
import tempfile
import os

# =========================================tv
# PARSE YAML FRONTMATTER
# ==========================================

def parse_frontmatter(text: str):

    match = re.match(r"^---(.*?)---(.*)$", text, re.DOTALL)

    if not match:
        return {}, text

    meta = yaml.safe_load(match.group(1))
    body = match.group(2).strip()

    return meta, body

# ==========================================
# EXECUTE PYTHON CODE
# ==========================================

def run_python(code: str):

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
# EXECUTE R CODE (OPTIONAL)
# ==========================================

def run_r(code: str):

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
# PROCESS CODE BLOCKS
# ==========================================

def process_blocks(text: str):

    def replacer(match):

        lang = match.group(1)
        code = match.group(2)

        if lang == "python":
            output = run_python(code)
            return f"""
```python
{code}
