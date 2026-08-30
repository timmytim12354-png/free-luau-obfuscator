#!/usr/bin/env node
/**
 * Local Luau-ish minify / format. MIT.
 * Not wYnFuscate. Not authentication. Not a security boundary.
 */
import fs from "node:fs";
import path from "node:path";

const usage = `Usage:
  node cli/kf-luau.mjs minify <file.luau>
  node cli/kf-luau.mjs format <file.luau>
`;

function stripLineComment(line) {
  let inSingle = false;
  let inDouble = false;
  for (let i = 0; i < line.length; i += 1) {
    const ch = line[i];
    const prev = i > 0 ? line[i - 1] : "";
    if (ch === "'" && !inDouble && prev !== "\\") inSingle = !inSingle;
    else if (ch === '"' && !inSingle && prev !== "\\") inDouble = !inDouble;
    else if (ch === "-" && line[i + 1] === "-" && !inSingle && !inDouble) {
      return line.slice(0, i).trimEnd();
    }
  }
  return line;
}

function minify(source) {
  return `${source
    .split(/\r?\n/)
    .map((line) => stripLineComment(line).trimEnd())
    .filter((line) => line.trim() !== "")
    .join("\n")}\n`;
}

function format(source) {
  let depth = 0;
  const lines = source.split(/\r?\n/).map((raw) => {
    const trimmed = raw.trim();
    if (!trimmed) return "";
    const closerFirst = /^(end\b|until\b|else\b|elseif\b)/.test(trimmed);
    if (closerFirst) depth = Math.max(0, depth - 1);
    const out = `${"    ".repeat(depth)}${trimmed}`;
    if (closerFirst) {
      if (/^(else\b|elseif\b)/.test(trimmed)) depth += 1;
    } else if (
      /^(local\s+function\b|function\b|if\b|for\b|while\b|repeat\b)/.test(trimmed) ||
      /\bthen\b$|\bdo\b$/.test(trimmed)
    ) {
      depth += 1;
    }
    return out;
  });
  return `${lines.join("\n").replace(/\n{3,}/g, "\n\n")}\n`;
}

function main(argv) {
  const [cmd, file] = argv;
  if (!cmd || !file || (cmd !== "minify" && cmd !== "format")) {
    process.stderr.write(usage);
    process.exit(1);
  }
  const abs = path.resolve(file);
  if (!fs.existsSync(abs)) {
    process.stderr.write(`File not found: ${abs}\n`);
    process.exit(1);
  }
  const source = fs.readFileSync(abs, "utf8");
  const next = cmd === "minify" ? minify(source) : format(source);
  const ext = path.extname(abs) || ".luau";
  const base = abs.slice(0, abs.length - ext.length);
  const out = `${base}.${cmd === "minify" ? "min" : "fmt"}${ext}`;
  fs.writeFileSync(out, next);
  process.stdout.write(`Wrote ${out}\n`);
}

main(process.argv.slice(2));
