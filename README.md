# Human Nutrition Facts

**Live:** https://human-nutrition.anishsheela.com

What is the nutritional value of a human? Enter sex, age, height and weight (body fat optional) and get the full EU/German-style nutrition label for your own body: energy, fat and fatty acids, carbohydrate, sugars, protein, salt, 13 vitamins and 14 minerals with % reference intakes, an ingredients list, Nutri-Score, EU nutrition claims, and a breakdown by chemical element. English and German.

> **Just for fun.** This is a thought experiment about what a body is made of, dressed up as a food label. It does not encourage eating humans in any way. Please don't.

The idea comes from an [xkcd](https://xkcd.com/) video. Made by [anishanilkumar.com](https://anishanilkumar.com).

## How it works

Everything is one page, `index.html`, plus two self-hosted fonts in `fonts/`: no build step and no dependencies. The page is designed as a printer's proof of a flattened box, with a cellophane window on the front showing the body's contents layered by density (minerals sink, fat floats). All calculation happens in the browser; the parameters live in the URL fragment (`#s=m&a=35&h=180&w=75`), which is never sent to the server. `?lang=de` or `?lang=en` picks the language; English is the default.

The model, in short:

- **Body fat** is taken as entered, or estimated from BMI, age and sex (Deurenberg et al. 1991).
- **Fat-free mass** is split into about 19.5 % protein, 6.8 % minerals, roughly 1 % glycogen and glucose, and water for the rest (Wang et al. 1992).
- **Energy** uses the EU factors: fat 37 kJ/g, protein and carbohydrate 17 kJ/g.
- **Minerals and trace elements** come from the ICRP Reference Man and Emsley's *Nature's Building Blocks*, scaled to fat-free mass.
- **Vitamins** are body-store estimates from the nutrition literature. Each row on the label is marked well established, estimate, or rough estimate.
- **Nutri-Score** uses the 2017 solid-food algorithm. **Best before** uses remaining life expectancy from the Destatis life table.

These are population-level estimates with ±20 % or more of error. Not medical advice.

## Hosting

Served by nginx on a NixOS box. The page is copied into the NixOS config repo and served from the Nix store, so deploying means copying `index.html` over and running `nixos-rebuild switch`.

## Fonts

[Archivo](https://fonts.google.com/specimen/Archivo) and [Shrikhand](https://fonts.google.com/specimen/Shrikhand), both under the SIL Open Font License 1.1. They are self-hosted rather than loaded from Google's CDN, which German courts have ruled a GDPR problem.
