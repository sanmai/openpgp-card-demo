# Easy virtual OpenGPG card with Docker

To launch, run:

```
make
```

Then `gpg --card-edit`, and so on.

Default password for the card is `12345678`.

## Credits

This project is largely based on these instructions:

https://github.com/OpenSC/OpenSC/blob/master/.travis.yml#L116

Additional reading:

- https://github.com/OpenSC/OpenSC/wiki/Smart-Card-Simulation
- https://frankmorgner.github.io/vsmartcard/virtualsmartcard/README.html
