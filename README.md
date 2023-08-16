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
quarto render --to his-pdf
```

or for preview:

```bash
quarto preview --to his-html
```

or in your document yaml:

```yaml
format:
  his-pdf:
    keep-tex: true
```

## Format Options

The his-template format supports a number of options for customizing the format and appearance of the document. Specify these under the `his-metadata` key.

---
**`publicationtype`**

Two main types of outputs, thesis or report. The thesis outputs are intended for printing, and are therefore typeset on a smaller paper size. They also require different content.

`dissertation` - uses a purple background

`licentiate` - uses a grey background

The proposal outputs are instead in a4 format:

`researchproposal` - for research proposals

`thesisproposal` - for thesis proposals

---

For example, from `_quarto.yml`:

``` yaml
format:
  his-pdf:
    keep-tex: true
    classoption:
      - english
      - cover
      - final
  his-html: default

his-metadata:
  coverimage: foto.jpg
  coverphoto: face.jpg
  publicationtype: dissertation
  sammanfattning: Abstract in Swedish
  shortabstract: Summary on the back of the thesis
  fullarticles: |
    \fullarticle[scale=.7,trim={0mm 5mm 0mm 5mm},pages=-][\href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{\ccbyncnd}]{fischer2017doctoraldissertationmanual}{manual.pdf}
    \fullarticle[scale=.7,trim={0mm 5mm 0mm 5mm},pages=1][\copyright{} 2018 University of Skövde. Reprinted, with permission, from]{fischer2017doctoraldissertationmanual}{manual.pdf}
    \fullarticle[scale=.7,trim={0mm 5mm 0mm 5mm},pages=1][Reprinted from][with permission from University of Skövde.]{fischer2017doctoraldissertationmanual}{manual.pdf}
  acronyms: |
    \newacronym{moo}{MOO}{Multi-Objective Optimization}
    \newacronym{sbo}{SBO}{Simulation-Based Optimization}
    \newacronym{ai}{AI}{Artificial Intelligence}
    \newacronym{doe}{DOE}{Design of Experiments}
  ownpublications: |
    \authorspublication{fischer2017doctoraldissertationmanual}
    \authorspublication[Design, manuscript preparation, review]{fischer2017doctoraldissertationmanual}
```
