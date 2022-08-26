# Quarto format template for University of Skövde PhD education

This is a Quarto template that assists you in creating a manuscript for your PhD thesis at the University of Skövde. You can learn more about ...

## Creating a New Manuscript

You can use this as a template to create a manuscript for a dissertation, licentiate thesis, thesis proposal, or research proposal. To do this, use the following command:

```bash
quarto use template verbalins/his-template
```

This will install the extension and create an example qmd file and bibiography that you can use as a starting place for your article.

## Installation For Existing Document

You may also use this format with an existing Quarto project or document. From the quarto project or document directory, run the following command to install this format:

```bash
quarto install extension verbalins/his-template
```

## Usage

To use the format, you can use the format names `his-pdf` and `his-html`. For example:

```bash
quarto render article.qmd --to his-pdf
```

or in your document yaml

```yaml
format:
  aft-pdf:
    keep-tex: true    
```

## Format Options

The his-template format supports a number of options for customizing the format and appearance of the document. Specify these under the `his-metadata` key.

**TODO**
Right now copied from the Elsevier format.

---

**`formatting`**

`preprint` - default, which produces a standard preprint format

`review` - produces a document with additional spacing between elements (good for notes and comments)

`doubleblind` - omits the title block, allow for a doubleblind review

---

**`model`**

`1p` - the `1p` model of Elsevier journal formats. Always single column.

`3p` - the `3p` model of Elsevier journal formats. Sometimes single column, sometimes two column. Refer to the specific journal for guidance.

`5p` - the `5p` model of Elsevier journal formats. Always two column.

---

**`layout`**

`onecolumn` - for `3p` model documents, use a single column format (default)

`twocolumn` - for `3p` model documents, use a two column format

---

**`cite-style`**

`number` - use numbered formatting for citations (default).

`numbername` - use numbered name formatting citations.

`authoryear` - use author / year formatting (harvard) for citations.

Please refer to the specific journal for guidance.

---

**`graphical-abstract`**

Produces a separate page before the main document with a graphical abstract.

---

**`highlights`**

Produces a separate page before the main document with a list of highlights.

---

For example:

``` yaml
format:
  elsevier-pdf:
    journal:
      formatting: preprint
      model: 3p
      layout: twocolumn
      cite-style: numbered
      graphical-abstract: "![](abstract.png)"
      highlights:
        - Highlight 1
        - Highlight 2 
        - Highlight 3
```
