Map<String, dynamic > json = {
  "openapi": "3.0.0",
  "info": {
    "title": "Joylly Documentation",
    "version": "1.0.0"
  },
  "paths": {
    "/files/public/{ext}": {
      "get": {
        "description": "Wygeneruj presigned url publiczny np. do zdjęcia prof.",
        "tags": ["Files"],
        "produces": ["application/json"],
        "parameters": [{
          "name": "ext",
          "description": "Rozszerzenie pliku.",
          "in": "formData",
          "example": "png",
          "required": true,
          "type": "string"
        }],
        "responses": {
          "200": {
            "description": "Presigned url was created, send files directly to it.",
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "url": {
                      "type": "string",
                      "description": "Adres url do wrzucenia pliku.",
                      "in": "formData",
                      "example": "htts://connectstatic.ams3.digitaloecan.com"
                    }
                  }
                }
              }
            }
          },
          "400": {
            "description": "Incorrect data provided"
          },
          "401": {
            "description": "Access Denied"
          },
          "501": {
            "description": "Internal error server"
          }
        }
      }
    },
    "/files/read/{key}": {
      "get": {
        "description": "Wygeneruj presigned url do odczytu prywatnego pliku.",
        "tags": ["Files"],
        "produces": ["application/json"],
        "parameters": [{
          "name": "key",
          "description": "Identyfikator pliku.",
          "in": "formData",
          "example": "dsf-dsf-sfsdfsdfs-sdfsdfsdf.png",
          "required": true,
          "type": "string"
        }],
        "responses": {
          "200": {
            "description": "Presigned url was created, send files directly to it."
          },
          "400": {
            "description": "Incorrect data provided"
          },
          "401": {
            "description": "Access Denied"
          },
          "501": {
            "description": "Internal error server"
          }
        }
      }
    },
    "/files/private": {
      "post": {
        "description": "Wygeneruj presigned url prywatny",
        "tags": ["Files"],
        "produces": ["application/json"],
        "parameters": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "ext": {
                    "type": "string",
                    "description": "Końcówka rozszerzenia pliku.",
                    "in": "formData",
                    "example": "png"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Presigned url was created, send files directly to it.",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "url": {
                        "type": "string",
                        "description": "Presigned url dla pliku",
                        "example": "https://connectstatic.ams3.digitalocean.com/sdf43jfsdj"
                      }
                    }
                  }
                }
              }
            }
          },
          "400": {
            "description": "Incorrect data provided"
          },
          "401": {
            "description": "Access Denied"
          },
          "501": {
            "description": "Internal error server"
          }
        }
      }
    },
    "/places": {
      "get": {
        "description": "Get places",
        "tags": ["Places"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "location": {
                        "type": "object",
                        "properties": {
                          "coordinates": {
                            "type": "array",
                            "items": {
                              "type": "integer"
                            }
                          }
                        }
                      },
                      "commentCount": {
                        "type": "integer"
                      },
                      "rateSum": {
                        "type": "integer"
                      },
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "version": {
                        "type": "integer"
                      },
                      "freeAccess": {
                        "type": "boolean"
                      },
                      "verified": {
                        "type": "boolean"
                      },
                      "route": {
                        "type": "object",
                        "properties": {
                          "distance": {
                            "type": "integer"
                          },
                          "time": {
                            "type": "integer"
                          },
                          "difficulty": {
                            "type": "integer"
                          },
                          "id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "services": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "id": {
                        "type": "string"
                      },
                      "owner": {
                        "type": "string"
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "type": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "address": {
                        "type": "string"
                      },
                      "closedDays": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "date"
                        }
                      },
                      "pricing": {
                        "type": "array",
                        "items": {
                          "serviceName": {
                            "type": "string"
                          },
                          "service": {
                            "type": "string"
                          },
                          "price": {
                            "type": "integer"
                          },
                          "currency": {
                            "type": "string"
                          },
                          "canBuyOnline": {
                            "type": "boolean"
                          }
                        }
                      },
                      "openingHours": {
                        "type": "array",
                        "items": {
                          "day": {
                            "type": "integer"
                          },
                          "from": {
                            "type": "object",
                            "properties": {
                              "hour": {
                                "type": "integer"
                              },
                              "minute": {
                                "type": "integer"
                              }
                            }
                          }
                        }
                      },
                      "comments": {
                        "type": "array",
                        "items": {
                          "sender": {
                            "type": "string"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "rate": {
                            "type": "integer"
                          },
                          "image": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      },
                      "latestComments": {
                        "type": "array",
                        "items": {
                          "rate": {
                            "type": "integer"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "image": {
                            "type": "string"
                          },
                          "sender": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      },
                      "__v": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Create place",
        "tags": ["Place"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "description": {
                    "type": "string"
                  },
                  "type": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  },
                  "address": {
                    "type": "string"
                  },
                  "freeAccess": {
                    "type": "boolean"
                  },
                  "route": {
                    "type": "object",
                    "optional": true,
                    "parameters": {
                      "routeId": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "startingPoint": {
                        "type": "array",
                        "items": {
                          "type": "integer"
                        }
                      },
                      "name": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "place.success.create"
          },
          "400": {
            "description": "route.error.invalid-data-provided"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/mine": {
      "get": {
        "description": "Get places you own",
        "tags": ["Places"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "owner": {
                        "type": "string"
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "type": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "address": {
                        "type": "string"
                      },
                      "pricing": {
                        "type": "array",
                        "items": {
                          "serviceName": {
                            "type": "string"
                          },
                          "service": {
                            "type": "string"
                          },
                          "price": {
                            "type": "integer"
                          },
                          "currency": {
                            "type": "string"
                          },
                          "canBuyOnline": {
                            "type": "boolean"
                          }
                        }
                      },
                      "freeAccess": {
                        "type": "boolean"
                      },
                      "rateSum": {
                        "type": "integer"
                      },
                      "location": {
                        "type": "object",
                        "properties": {
                          "coordinates": {
                            "type": "array",
                            "items": {
                              "type": "integer"
                            }
                          }
                        }
                      },
                      "verified": {
                        "type": "boolean"
                      },
                      "services": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "route": {
                        "type": "object",
                        "properties": {
                          "distance": {
                            "type": "integer"
                          },
                          "time": {
                            "type": "integer"
                          },
                          "difficulty": {
                            "type": "integer"
                          },
                          "id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "openingHours": {
                        "type": "array",
                        "items": {
                          "day": {
                            "type": "integer"
                          },
                          "from": {
                            "type": "object",
                            "properties": {
                              "hour": {
                                "type": "integer"
                              },
                              "minute": {
                                "type": "integer"
                              }
                            }
                          }
                        }
                      },
                      "closedDays": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "date"
                        }
                      },
                      "latestComments": {
                        "type": "array",
                        "items": {
                          "rate": {
                            "type": "integer"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "image": {
                            "type": "string"
                          },
                          "sender": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/{id}": {
      "get": {
        "description": "Get place by id",
        "tags": ["Places"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "owner": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          }
                        }
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "type": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "address": {
                        "type": "string"
                      },
                      "pricing": {
                        "type": "array",
                        "items": {
                          "serviceName": {
                            "type": "string"
                          },
                          "service": {
                            "type": "string"
                          },
                          "price": {
                            "type": "integer"
                          },
                          "currency": {
                            "type": "string"
                          },
                          "canBuyOnline": {
                            "type": "boolean"
                          }
                        }
                      },
                      "freeAccess": {
                        "type": "boolean"
                      },
                      "location": {
                        "type": "object",
                        "properties": {
                          "coordinates": {
                            "type": "array",
                            "items": {
                              "type": "integer"
                            }
                          }
                        }
                      },
                      "verified": {
                        "type": "boolean"
                      },
                      "services": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "name": {
                            "type": "string"
                          },
                          "type": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "description": {
                            "type": "string"
                          },
                          "owner": {
                            "type": "string"
                          },
                          "images": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "specialists": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "supportedAnimals": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "forbiddenBreeds": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "ObjectId"
                            }
                          }
                        }
                      },
                      "route": {
                        "type": "object",
                        "properties": {
                          "distance": {
                            "type": "integer"
                          },
                          "time": {
                            "type": "integer"
                          },
                          "difficulty": {
                            "type": "integer"
                          },
                          "id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "info": {
                            "type": "object",
                            "properties": {
                              "distance": {
                                "type": "integer"
                              },
                              "time": {
                                "type": "integer"
                              },
                              "heightDifference": {
                                "type": "integer"
                              },
                              "checkPoints": {
                                "type": "array",
                                "items": {
                                  "type": "object",
                                  "properties": {
                                    "name": {
                                      "type": "string"
                                    },
                                    "location": {
                                      "type": "object",
                                      "properties": {
                                        "coordinates": {
                                          "type": "array",
                                          "items": {
                                            "type": "integer"
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              },
                              "points": {
                                "type": "array",
                                "items": {
                                  "type": "object",
                                  "properties": {
                                    "height": {
                                      "type": "integer"
                                    },
                                    "time": {
                                      "type": "string",
                                      "format": "date-time"
                                    },
                                    "location": {
                                      "type": "object",
                                      "properties": {
                                        "coordinates": {
                                          "type": "array",
                                          "items": {
                                            "type": "integer"
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              },
                              "public": {
                                "type": "object",
                                "properties": {
                                  "name": {
                                    "type": "string"
                                  },
                                  "place": {
                                    "type": "string",
                                    "format": "ObjectId"
                                  },
                                  "location": {
                                    "type": "object",
                                    "properties": {
                                      "coordinates": {
                                        "type": "array",
                                        "items": {
                                          "type": "integer"
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      },
                      "rateSum": {
                        "type": "integer"
                      },
                      "openingHours": {
                        "type": "array",
                        "items": {
                          "day": {
                            "type": "integer"
                          },
                          "from": {
                            "type": "object",
                            "properties": {
                              "hour": {
                                "type": "integer"
                              },
                              "minute": {
                                "type": "integer"
                              }
                            }
                          }
                        }
                      },
                      "closedDays": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "date"
                        }
                      },
                      "latestComments": {
                        "type": "array",
                        "items": {
                          "rate": {
                            "type": "integer"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "image": {
                            "type": "string"
                          },
                          "sender": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "patch": {
        "description": "Delete place",
        "tags": ["Place"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "description": {
                    "type": "string"
                  },
                  "type": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  },
                  "address": {
                    "type": "string"
                  },
                  "freeAccess": {
                    "type": "boolean"
                  },
                  "route": {
                    "type": "object",
                    "optional": true,
                    "parameters": {
                      "routeId": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "startingPoint": {
                        "type": "array",
                        "items": {
                          "type": "integer"
                        }
                      },
                      "name": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "place.success.delete"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/around": {
      "post": {
        "description": "Get places around",
        "tags": ["Place"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "x": {
                    "type": "integer"
                  },
                  "y": {
                    "type": "integer"
                  },
                  "areaRadius": {
                    "type": "integer"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "place.success.get",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "location": {
                        "type": "object",
                        "properties": {
                          "coordinates": {
                            "type": "array",
                            "items": {
                              "type": "integer"
                            }
                          }
                        }
                      },
                      "commentCount": {
                        "type": "integer"
                      },
                      "rateSum": {
                        "type": "integer"
                      },
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "version": {
                        "type": "integer"
                      },
                      "freeAccess": {
                        "type": "boolean"
                      },
                      "verified": {
                        "type": "boolean"
                      },
                      "route": {
                        "type": "object",
                        "properties": {
                          "distance": {
                            "type": "integer"
                          },
                          "time": {
                            "type": "integer"
                          },
                          "difficulty": {
                            "type": "integer"
                          },
                          "id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "services": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "id": {
                        "type": "string"
                      },
                      "owner": {
                        "type": "string"
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "type": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "address": {
                        "type": "string"
                      },
                      "closedDays": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "date"
                        }
                      },
                      "pricing": {
                        "type": "array",
                        "items": {
                          "serviceName": {
                            "type": "string"
                          },
                          "service": {
                            "type": "string"
                          },
                          "price": {
                            "type": "integer"
                          },
                          "currency": {
                            "type": "string"
                          },
                          "canBuyOnline": {
                            "type": "boolean"
                          }
                        }
                      },
                      "openingHours": {
                        "type": "array",
                        "items": {
                          "day": {
                            "type": "integer"
                          },
                          "from": {
                            "type": "object",
                            "properties": {
                              "hour": {
                                "type": "integer"
                              },
                              "minute": {
                                "type": "integer"
                              }
                            }
                          }
                        }
                      },
                      "comments": {
                        "type": "array",
                        "items": {
                          "sender": {
                            "type": "string"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "rate": {
                            "type": "integer"
                          },
                          "image": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      },
                      "latestComments": {
                        "type": "array",
                        "items": {
                          "rate": {
                            "type": "integer"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "image": {
                            "type": "string"
                          },
                          "sender": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      },
                      "__v": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          },
          "400": {
            "description": "route.error.invalid-data-provided"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/{id}/route": {
      "patch": {
        "description": "Update place route",
        "tags": ["Place"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "routeId": {
                    "type": "string",
                    "format": "ObjectId"
                  },
                  "name": {
                    "type": "string"
                  },
                  "startingPoint": {
                    "type": "array",
                    "items": {
                      "type": "integer"
                    }
                  }
                }
              }
            }
          }
        },
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "place-route.success.update"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Delete place route",
        "tags": ["Place"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "place-route.success.delete"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/{id}/comment": {
      "post": {
        "description": "Add place comment",
        "tags": ["Place"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "comment": {
                    "type": "string"
                  },
                  "rate": {
                    "type": "integer"
                  },
                  "image": {
                    "type": "string",
                    "optional": true
                  }
                }
              }
            }
          }
        },
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "place-comment.success.create"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Delete place comment",
        "tags": ["Place"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }, {
          "in": "path",
          "name": "id",
          "description": "Comment id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "place-comment.success.delete"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/{id}/verify": {
      "get": {
        "description": "Get place verified",
        "tags": ["Place"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "place-verify.success.update"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Delete place verification",
        "tags": ["Place"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "place-unverify.success.update"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/map/around": {
      "get": {
        "description": "Get places around",
        "tags": ["Place"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "x": {
                    "type": "integer"
                  },
                  "y": {
                    "type": "integer"
                  },
                  "areaRadius": {
                    "type": "integer"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "owner": {
                        "type": "string"
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "type": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "address": {
                        "type": "string"
                      },
                      "pricing": {
                        "type": "array",
                        "items": {
                          "serviceName": {
                            "type": "string"
                          },
                          "service": {
                            "type": "string"
                          },
                          "price": {
                            "type": "integer"
                          },
                          "currency": {
                            "type": "string"
                          },
                          "canBuyOnline": {
                            "type": "boolean"
                          }
                        }
                      },
                      "freeAccess": {
                        "type": "boolean"
                      },
                      "rateSum": {
                        "type": "integer"
                      },
                      "location": {
                        "type": "object",
                        "properties": {
                          "coordinates": {
                            "type": "array",
                            "items": {
                              "type": "integer"
                            }
                          }
                        }
                      },
                      "verified": {
                        "type": "boolean"
                      },
                      "services": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "route": {
                        "type": "object",
                        "properties": {
                          "distance": {
                            "type": "integer"
                          },
                          "time": {
                            "type": "integer"
                          },
                          "difficulty": {
                            "type": "integer"
                          },
                          "id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "openingHours": {
                        "type": "array",
                        "items": {
                          "day": {
                            "type": "integer"
                          },
                          "from": {
                            "type": "object",
                            "properties": {
                              "hour": {
                                "type": "integer"
                              },
                              "minute": {
                                "type": "integer"
                              }
                            }
                          }
                        }
                      },
                      "closedDays": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "date"
                        }
                      },
                      "latestComments": {
                        "type": "array",
                        "items": {
                          "rate": {
                            "type": "integer"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "image": {
                            "type": "string"
                          },
                          "sender": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/map/name": {
      "get": {
        "description": "Get places by name",
        "tags": ["Place"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string",
                    "description": "Place name, min length 3"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "owner": {
                        "type": "string"
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "type": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "address": {
                        "type": "string"
                      },
                      "pricing": {
                        "type": "array",
                        "items": {
                          "serviceName": {
                            "type": "string"
                          },
                          "service": {
                            "type": "string"
                          },
                          "price": {
                            "type": "integer"
                          },
                          "currency": {
                            "type": "string"
                          },
                          "canBuyOnline": {
                            "type": "boolean"
                          }
                        }
                      },
                      "freeAccess": {
                        "type": "boolean"
                      },
                      "rateSum": {
                        "type": "integer"
                      },
                      "location": {
                        "type": "object",
                        "properties": {
                          "coordinates": {
                            "type": "array",
                            "items": {
                              "type": "integer"
                            }
                          }
                        }
                      },
                      "verified": {
                        "type": "boolean"
                      },
                      "services": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "route": {
                        "type": "object",
                        "properties": {
                          "distance": {
                            "type": "integer"
                          },
                          "time": {
                            "type": "integer"
                          },
                          "difficulty": {
                            "type": "integer"
                          },
                          "id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "openingHours": {
                        "type": "array",
                        "items": {
                          "day": {
                            "type": "integer"
                          },
                          "from": {
                            "type": "object",
                            "properties": {
                              "hour": {
                                "type": "integer"
                              },
                              "minute": {
                                "type": "integer"
                              }
                            }
                          }
                        }
                      },
                      "closedDays": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "date"
                        }
                      },
                      "latestComments": {
                        "type": "array",
                        "items": {
                          "rate": {
                            "type": "integer"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "image": {
                            "type": "string"
                          },
                          "sender": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "database.error.not-performed or user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/map/events-around": {
      "get": {
        "description": "Get events around",
        "tags": ["Place"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "owner": {
                        "type": "string"
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "type": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "address": {
                        "type": "string"
                      },
                      "pricing": {
                        "type": "array",
                        "items": {
                          "serviceName": {
                            "type": "string"
                          },
                          "service": {
                            "type": "string"
                          },
                          "price": {
                            "type": "integer"
                          },
                          "currency": {
                            "type": "string"
                          },
                          "canBuyOnline": {
                            "type": "boolean"
                          }
                        }
                      },
                      "freeAccess": {
                        "type": "boolean"
                      },
                      "rateSum": {
                        "type": "integer"
                      },
                      "location": {
                        "type": "object",
                        "properties": {
                          "coordinates": {
                            "type": "array",
                            "items": {
                              "type": "integer"
                            }
                          }
                        }
                      },
                      "verified": {
                        "type": "boolean"
                      },
                      "services": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "route": {
                        "type": "object",
                        "properties": {
                          "distance": {
                            "type": "integer"
                          },
                          "time": {
                            "type": "integer"
                          },
                          "difficulty": {
                            "type": "integer"
                          },
                          "id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "openingHours": {
                        "type": "array",
                        "items": {
                          "day": {
                            "type": "integer"
                          },
                          "from": {
                            "type": "object",
                            "properties": {
                              "hour": {
                                "type": "integer"
                              },
                              "minute": {
                                "type": "integer"
                              }
                            }
                          }
                        }
                      },
                      "closedDays": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "date"
                        }
                      },
                      "latestComments": {
                        "type": "array",
                        "items": {
                          "rate": {
                            "type": "integer"
                          },
                          "comment": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "image": {
                            "type": "string"
                          },
                          "sender": {
                            "type": "string"
                          },
                          "createdAt": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "database.error.not-performed / user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/places/map/utilities-around": {
      "get": {
        "description": "Get utilities around",
        "tags": ["Place"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "vets": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "owner": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "description": {
                            "type": "string"
                          },
                          "type": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "address": {
                            "type": "string"
                          },
                          "pricing": {
                            "type": "array",
                            "items": {
                              "serviceName": {
                                "type": "string"
                              },
                              "service": {
                                "type": "string"
                              },
                              "price": {
                                "type": "integer"
                              },
                              "currency": {
                                "type": "string"
                              },
                              "canBuyOnline": {
                                "type": "boolean"
                              }
                            }
                          },
                          "freeAccess": {
                            "type": "boolean"
                          },
                          "rateSum": {
                            "type": "integer"
                          },
                          "location": {
                            "type": "object",
                            "properties": {
                              "coordinates": {
                                "type": "array",
                                "items": {
                                  "type": "integer"
                                }
                              }
                            }
                          },
                          "verified": {
                            "type": "boolean"
                          },
                          "services": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "route": {
                            "type": "object",
                            "properties": {
                              "distance": {
                                "type": "integer"
                              },
                              "time": {
                                "type": "integer"
                              },
                              "difficulty": {
                                "type": "integer"
                              },
                              "id": {
                                "type": "string",
                                "format": "ObjectId"
                              }
                            }
                          },
                          "openingHours": {
                            "type": "array",
                            "items": {
                              "day": {
                                "type": "integer"
                              },
                              "from": {
                                "type": "object",
                                "properties": {
                                  "hour": {
                                    "type": "integer"
                                  },
                                  "minute": {
                                    "type": "integer"
                                  }
                                }
                              }
                            }
                          },
                          "closedDays": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "date"
                            }
                          },
                          "latestComments": {
                            "type": "array",
                            "items": {
                              "rate": {
                                "type": "integer"
                              },
                              "comment": {
                                "type": "string"
                              },
                              "name": {
                                "type": "string"
                              },
                              "profileImage": {
                                "type": "string"
                              },
                              "image": {
                                "type": "string"
                              },
                              "sender": {
                                "type": "string"
                              },
                              "createdAt": {
                                "type": "string",
                                "format": "date-time"
                              }
                            }
                          }
                        }
                      },
                      "petStores": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "owner": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "description": {
                            "type": "string"
                          },
                          "type": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "address": {
                            "type": "string"
                          },
                          "pricing": {
                            "type": "array",
                            "items": {
                              "serviceName": {
                                "type": "string"
                              },
                              "service": {
                                "type": "string"
                              },
                              "price": {
                                "type": "integer"
                              },
                              "currency": {
                                "type": "string"
                              },
                              "canBuyOnline": {
                                "type": "boolean"
                              }
                            }
                          },
                          "freeAccess": {
                            "type": "boolean"
                          },
                          "rateSum": {
                            "type": "integer"
                          },
                          "location": {
                            "type": "object",
                            "properties": {
                              "coordinates": {
                                "type": "array",
                                "items": {
                                  "type": "integer"
                                }
                              }
                            }
                          },
                          "verified": {
                            "type": "boolean"
                          },
                          "services": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "route": {
                            "type": "object",
                            "properties": {
                              "distance": {
                                "type": "integer"
                              },
                              "time": {
                                "type": "integer"
                              },
                              "difficulty": {
                                "type": "integer"
                              },
                              "id": {
                                "type": "string",
                                "format": "ObjectId"
                              }
                            }
                          },
                          "openingHours": {
                            "type": "array",
                            "items": {
                              "day": {
                                "type": "integer"
                              },
                              "from": {
                                "type": "object",
                                "properties": {
                                  "hour": {
                                    "type": "integer"
                                  },
                                  "minute": {
                                    "type": "integer"
                                  }
                                }
                              }
                            }
                          },
                          "closedDays": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "date"
                            }
                          },
                          "latestComments": {
                            "type": "array",
                            "items": {
                              "rate": {
                                "type": "integer"
                              },
                              "comment": {
                                "type": "string"
                              },
                              "name": {
                                "type": "string"
                              },
                              "profileImage": {
                                "type": "string"
                              },
                              "image": {
                                "type": "string"
                              },
                              "sender": {
                                "type": "string"
                              },
                              "createdAt": {
                                "type": "string",
                                "format": "date-time"
                              }
                            }
                          }
                        }
                      },
                      "routes": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "owner": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "description": {
                            "type": "string"
                          },
                          "type": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "address": {
                            "type": "string"
                          },
                          "pricing": {
                            "type": "array",
                            "items": {
                              "serviceName": {
                                "type": "string"
                              },
                              "service": {
                                "type": "string"
                              },
                              "price": {
                                "type": "integer"
                              },
                              "currency": {
                                "type": "string"
                              },
                              "canBuyOnline": {
                                "type": "boolean"
                              }
                            }
                          },
                          "freeAccess": {
                            "type": "boolean"
                          },
                          "rateSum": {
                            "type": "integer"
                          },
                          "location": {
                            "type": "object",
                            "properties": {
                              "coordinates": {
                                "type": "array",
                                "items": {
                                  "type": "integer"
                                }
                              }
                            }
                          },
                          "verified": {
                            "type": "boolean"
                          },
                          "services": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "route": {
                            "type": "object",
                            "properties": {
                              "distance": {
                                "type": "integer"
                              },
                              "time": {
                                "type": "integer"
                              },
                              "difficulty": {
                                "type": "integer"
                              },
                              "id": {
                                "type": "string",
                                "format": "ObjectId"
                              }
                            }
                          },
                          "openingHours": {
                            "type": "array",
                            "items": {
                              "day": {
                                "type": "integer"
                              },
                              "from": {
                                "type": "object",
                                "properties": {
                                  "hour": {
                                    "type": "integer"
                                  },
                                  "minute": {
                                    "type": "integer"
                                  }
                                }
                              }
                            }
                          },
                          "closedDays": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "date"
                            }
                          },
                          "latestComments": {
                            "type": "array",
                            "items": {
                              "rate": {
                                "type": "integer"
                              },
                              "comment": {
                                "type": "string"
                              },
                              "name": {
                                "type": "string"
                              },
                              "profileImage": {
                                "type": "string"
                              },
                              "image": {
                                "type": "string"
                              },
                              "sender": {
                                "type": "string"
                              },
                              "createdAt": {
                                "type": "string",
                                "format": "date-time"
                              }
                            }
                          }
                        }
                      },
                      "other": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "owner": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "description": {
                            "type": "string"
                          },
                          "type": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "address": {
                            "type": "string"
                          },
                          "pricing": {
                            "type": "array",
                            "items": {
                              "serviceName": {
                                "type": "string"
                              },
                              "service": {
                                "type": "string"
                              },
                              "price": {
                                "type": "integer"
                              },
                              "currency": {
                                "type": "string"
                              },
                              "canBuyOnline": {
                                "type": "boolean"
                              }
                            }
                          },
                          "freeAccess": {
                            "type": "boolean"
                          },
                          "rateSum": {
                            "type": "integer"
                          },
                          "location": {
                            "type": "object",
                            "properties": {
                              "coordinates": {
                                "type": "array",
                                "items": {
                                  "type": "integer"
                                }
                              }
                            }
                          },
                          "verified": {
                            "type": "boolean"
                          },
                          "services": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "route": {
                            "type": "object",
                            "properties": {
                              "distance": {
                                "type": "integer"
                              },
                              "time": {
                                "type": "integer"
                              },
                              "difficulty": {
                                "type": "integer"
                              },
                              "id": {
                                "type": "string",
                                "format": "ObjectId"
                              }
                            }
                          },
                          "openingHours": {
                            "type": "array",
                            "items": {
                              "day": {
                                "type": "integer"
                              },
                              "from": {
                                "type": "object",
                                "properties": {
                                  "hour": {
                                    "type": "integer"
                                  },
                                  "minute": {
                                    "type": "integer"
                                  }
                                }
                              }
                            }
                          },
                          "closedDays": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "date"
                            }
                          },
                          "latestComments": {
                            "type": "array",
                            "items": {
                              "rate": {
                                "type": "integer"
                              },
                              "comment": {
                                "type": "string"
                              },
                              "name": {
                                "type": "string"
                              },
                              "profileImage": {
                                "type": "string"
                              },
                              "image": {
                                "type": "string"
                              },
                              "sender": {
                                "type": "string"
                              },
                              "createdAt": {
                                "type": "string",
                                "format": "date-time"
                              }
                            }
                          }
                        }
                      },
                      "activities": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "owner": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "description": {
                            "type": "string"
                          },
                          "type": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "address": {
                            "type": "string"
                          },
                          "pricing": {
                            "type": "array",
                            "items": {
                              "serviceName": {
                                "type": "string"
                              },
                              "service": {
                                "type": "string"
                              },
                              "price": {
                                "type": "integer"
                              },
                              "currency": {
                                "type": "string"
                              },
                              "canBuyOnline": {
                                "type": "boolean"
                              }
                            }
                          },
                          "freeAccess": {
                            "type": "boolean"
                          },
                          "rateSum": {
                            "type": "integer"
                          },
                          "location": {
                            "type": "object",
                            "properties": {
                              "coordinates": {
                                "type": "array",
                                "items": {
                                  "type": "integer"
                                }
                              }
                            }
                          },
                          "verified": {
                            "type": "boolean"
                          },
                          "services": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "route": {
                            "type": "object",
                            "properties": {
                              "distance": {
                                "type": "integer"
                              },
                              "time": {
                                "type": "integer"
                              },
                              "difficulty": {
                                "type": "integer"
                              },
                              "id": {
                                "type": "string",
                                "format": "ObjectId"
                              }
                            }
                          },
                          "openingHours": {
                            "type": "array",
                            "items": {
                              "day": {
                                "type": "integer"
                              },
                              "from": {
                                "type": "object",
                                "properties": {
                                  "hour": {
                                    "type": "integer"
                                  },
                                  "minute": {
                                    "type": "integer"
                                  }
                                }
                              }
                            }
                          },
                          "closedDays": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "date"
                            }
                          },
                          "latestComments": {
                            "type": "array",
                            "items": {
                              "rate": {
                                "type": "integer"
                              },
                              "comment": {
                                "type": "string"
                              },
                              "name": {
                                "type": "string"
                              },
                              "profileImage": {
                                "type": "string"
                              },
                              "image": {
                                "type": "string"
                              },
                              "sender": {
                                "type": "string"
                              },
                              "createdAt": {
                                "type": "string",
                                "format": "date-time"
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "database.error.not-performed / user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/provision": {
      "get": {
        "description": "Utworzenie użytkownika",
        "tags": ["Provision"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "type": {
                        "type": "string"
                      },
                      "price": {
                        "type": "number"
                      },
                      "country": {
                        "type": "string"
                      },
                      "currency": {
                        "type": "string"
                      },
                      "seller": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Create provision",
        "tags": ["Provision"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string"
                  },
                  "country": {
                    "type": "string"
                  },
                  "currency": {
                    "type": "string"
                  },
                  "price": {
                    "type": "number"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "provision.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "patch": {
        "description": "Create provision",
        "tags": ["Provision"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "ID provision"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "type": {
                    "type": "string"
                  },
                  "country": {
                    "type": "string"
                  },
                  "currency": {
                    "type": "string"
                  },
                  "price": {
                    "type": "number"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "provision.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/provision/{id}": {
      "get": {
        "description": "Utworzenie użytkownika",
        "tags": ["Provision"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "ID provision"
        }],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "appliaction/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "type": {
                      "type": "string"
                    },
                    "price": {
                      "type": "number"
                    },
                    "country": {
                      "type": "string"
                    },
                    "currency": {
                      "type": "string"
                    },
                    "seller": {
                      "type": "string"
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/routes/:{activity}": {
      "post": {
        "description": "Create a new route (activity)",
        "summary": "Create a new route (activity)",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "activity",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }],
        "responses": {
          "201": {
            "description": "route.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/routes/:{id}/coordinates": {
      "post": {
        "description": "Add route coordinates",
        "summary": "Add route coordinates",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "appliaction/json": {
              "schema": {
                "ref": "#/components/schemas/PostCoordinates"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "route-coordinates.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "route.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/routes/:{id}/route": {
      "post": {
        "description": "Add route path",
        "summary": "Add route path",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "appliaction/json": {
              "schema": {
                "ref": "#/components/schemas/PostRoutePath"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "route-submissiondate.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "route.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/routes/:{id}/publish": {
      "post": {
        "description": "Publish route",
        "summary": "Publish route",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }],
        "responses": {
          "200": {
            "description": "route-submissiondate.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "route.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/routes/:{id}/checkpoint": {
      "post": {
        "description": "Add route checkpoint",
        "summary": "Add route checkpoint",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "appliaction/json": {
              "schema": {
                "ref": "#/components/schemas/PostRouteCheckpoint"
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "route-checkpoint.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "route.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/routes/:{id}/checkpoint/{checkpoint}": {
      "put": {
        "description": "Edit route checkpoint",
        "summary": "Edit route checkpoint",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }, {
          "in": "path",
          "name": "checkpoint",
          "required": true,
          "type": "string",
          "description": "Checkpoint id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "appliaction/json": {
              "schema": {
                "ref": "#/components/schemas/PostRouteCheckpoint"
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "route-checkpoint.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "route.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Edit route checkpoint",
        "summary": "Edit route checkpoint",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }, {
          "in": "path",
          "name": "checkpoint",
          "required": true,
          "type": "string",
          "description": "Checkpoint id"
        }],
        "responses": {
          "201": {
            "description": "route-checkpoint.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "route.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/routes/:{id}": {
      "delete": {
        "description": "Delete route",
        "summary": "Delete route",
        "tags": ["Routes"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Activity id"
        }],
        "responses": {
          "201": {
            "description": "route.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "route.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/diseases": {
      "get": {
        "description": "Get all diseases",
        "summary": "Get all diseases",
        "tags": ["Admin Diseases"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "oneOf": [{
                      "ref": "#/components/schemas/Disease"
                    }]
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Create a new disease",
        "summary": "Create a new disease",
        "tags": ["Admin Diseases"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "ref": "#/components/schemas/DiseaseInputBody"
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "disease.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/diseases/{id}": {
      "get": {
        "description": "Get disease by id",
        "summary": "Get disease by id",
        "tags": ["Admin Diseases"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Disease id"
        }],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "oneOf": [{
                    "ref": "#/components/schemas/Disease"
                  }]
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "put": {
        "description": "Update disease",
        "summary": "Update disease",
        "tags": ["Admin Diseases"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Disease id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "ref": "#/components/schemas/DiseaseInputBody"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "disease.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Delete disease",
        "summary": "Delete disease",
        "tags": ["Admin Diseases"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Disease id"
        }],
        "responses": {
          "200": {
            "description": "disease.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/medicines": {
      "get": {
        "description": "Get medicines",
        "summary": "Get medicines",
        "tags": ["Admin Medicines"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "oneOf": [{
                      "ref": "#/components/schemas/Medicine"
                    }]
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Create a new medicine",
        "summary": "Create a new medicine",
        "tags": ["Admin Medicines"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "ref": "#/components/schemas/MedicineInputBody"
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "medicine.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/medicines/{id}": {
      "get": {
        "description": "Get medicine by id",
        "summary": "Get medicine by id",
        "tags": ["Admin Medicines"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Medicine id"
        }],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "ref": "#/components/schemas/Medicine"
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "medicine.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "patch": {
        "description": "Update medicine",
        "summary": "Update medicine",
        "tags": ["Admin Medicines"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Medicine id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "ref": "#/components/schemas/MedicineInputBody"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "medicine.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "medicine.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Delete medicine",
        "summary": "Delete medicine",
        "tags": ["Admin Medicines"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Medicine id"
        }],
        "responses": {
          "200": {
            "description": "medicine.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "medicine.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/symptoms": {
      "get": {
        "description": "Get all symptoms",
        "summary": "Get all symptoms",
        "tags": ["Admin Symptoms"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "oneOf": [{
                      "ref": "#/components/schemas/Symptom"
                    }]
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Create a new symptom",
        "summary": "Create a new symptom",
        "tags": ["Admin Symptoms"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "code": {
                    "type": "string"
                  },
                  "affectedAnimals": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  },
                  "probableDiseases": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "symptom.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/symptoms/{id}": {
      "get": {
        "description": "Get symptom by id",
        "summary": "Get symptom by id",
        "tags": ["Admin Symptoms"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Symptom id"
        }],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "ref": "#/components/schemas/Symptom"
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "symptom.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "patch": {
        "description": "Create a new symptom",
        "summary": "Create a new symptom",
        "tags": ["Admin Symptoms"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Symptom id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "code": {
                    "type": "string"
                  },
                  "affectedAnimals": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  },
                  "probableDiseases": {
                    "type": "array",
                    "items": {
                      "type": "string"
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "symptom.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "symptom.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Create a new symptom",
        "summary": "Create a new symptom",
        "tags": ["Admin Symptoms"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Symptom id"
        }],
        "responses": {
          "201": {
            "description": "symptom.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "symptom.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/symptoms/animals/{animal}": {
      "get": {
        "description": "Get symptoms by animal",
        "summary": "Get symptoms by animal",
        "tags": ["Admin Symptoms"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "animal",
          "required": true,
          "type": "string",
          "description": "Animal id"
        }],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "oneOf": [{
                      "ref": "#/components/schemas/Symptom"
                    }]
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/users/user/verify": {
      "put": {
        "description": "Verify user",
        "summary": "Verify user",
        "tags": ["Admin Users"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "userprofile.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/users/user/unverify": {
      "put": {
        "description": "Unverify user",
        "summary": "Unverify user",
        "tags": ["Admin Users"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "userprofile.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/users/user/verify/public-settings": {
      "put": {
        "description": "Verify user public settings",
        "summary": "Verify user public settings",
        "tags": ["Admin Users"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "userprofile.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/admin/users/user/unverify/public-settings": {
      "put": {
        "description": "Unverify user public settings",
        "summary": "Unverify user public settings",
        "tags": ["Admin Users"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "userprofile.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/health/pet/{id}/share": {
      "get": {
        "description": "Get pet share token",
        "tags": ["Health"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Pet id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "token": {
                        "type": "string",
                        "format": "JWT"
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "database.error.not-performed / pet.error.not-found / pet.error.unauthorized"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/health-check/pet/{id}": {
      "get": {
        "description": "Get health check by pet id",
        "tags": ["Health Check"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Pet id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "petHealthChecksList": {
                        "type": "array",
                        "items": {
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "version": {
                            "type": "integer"
                          },
                          "introducedBy": {
                            "type": "string"
                          },
                          "submissionDate": {
                            "type": "string",
                            "format": "date-time"
                          },
                          "pet": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "breed": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "age": {
                            "type": "integer"
                          },
                          "weight": {
                            "type": "integer"
                          },
                          "visit": {
                            "type": "string",
                            "format": "ObjectId"
                          },
                          "note": {
                            "type": "array"
                          },
                          "symptoms": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "ObjectId"
                            }
                          },
                          "diseases": {
                            "type": "array",
                            "items": {
                              "type": "string",
                              "format": "ObjectId"
                            }
                          },
                          "medicines": {
                            "type": "array",
                            "items": {
                              "type": "object",
                              "properties": {
                                "medicine": {
                                  "type": "string",
                                  "format": "ObjectId"
                                },
                                "amount": {
                                  "type": "integer"
                                },
                                "days": {
                                  "type": "integer"
                                }
                              }
                            }
                          }
                        }
                      },
                      "petLatestHealthCheck": {
                        "type": "object",
                        "properties": {
                          "latestHealthCheck": {
                            "type": "object",
                            "properties": {
                              "_id": {
                                "type": "string",
                                "format": "ObjectId"
                              },
                              "version": {
                                "type": "integer"
                              },
                              "introducedBy": {
                                "type": "string"
                              },
                              "submissionDate": {
                                "type": "string",
                                "format": "date-time"
                              },
                              "pet": {
                                "type": "string",
                                "format": "ObjectId"
                              },
                              "visit": {
                                "type": "string",
                                "format": "ObjectId"
                              },
                              "breed": {
                                "type": "object",
                                "properties": {
                                  "_id": {
                                    "type": "string",
                                    "format": "ObjectId"
                                  },
                                  "version": {
                                    "type": "integer"
                                  },
                                  "animal": {
                                    "type": "string"
                                  },
                                  "group": {
                                    "type": "string"
                                  },
                                  "groupNumber": {
                                    "type": "integer"
                                  },
                                  "country": {
                                    "type": "string"
                                  },
                                  "type": {
                                    "type": "string"
                                  },
                                  "key": {
                                    "type": "string"
                                  },
                                  "avatar": {
                                    "type": "string"
                                  },
                                  "description": {
                                    "type": "string"
                                  },
                                  "weight": {
                                    "type": "object",
                                    "properties": {
                                      "from": {
                                        "type": "integer"
                                      },
                                      "to": {
                                        "type": "integer"
                                      }
                                    }
                                  }
                                }
                              },
                              "age": {
                                "type": "integer"
                              },
                              "weight": {
                                "type": "integer"
                              },
                              "note": {
                                "type": "array"
                              },
                              "symptoms": {
                                "type": "array",
                                "items": {
                                  "type": "string",
                                  "format": "ObjectId"
                                }
                              },
                              "diseases": {
                                "type": "array",
                                "items": {
                                  "type": "string",
                                  "format": "ObjectId"
                                }
                              },
                              "medicines": {
                                "type": "array",
                                "items": {
                                  "type": "object",
                                  "properties": {
                                    "medicine": {
                                      "type": "string",
                                      "format": "ObjectId"
                                    },
                                    "amount": {
                                      "type": "integer"
                                    },
                                    "days": {
                                      "type": "integer"
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "pethealthcheck.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Create health check by pet id",
        "tags": ["Health Check"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Pet id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "weight": {
                    "type": "integer"
                  },
                  "symptoms": {
                    "type": "array",
                    "optional": true,
                    "items": {
                      "type": "string",
                      "format": "ObjectId"
                    }
                  },
                  "diseases": {
                    "type": "array",
                    "optional": true,
                    "items": {
                      "type": "string",
                      "format": "ObjectId"
                    }
                  },
                  "note": {
                    "type": "string",
                    "optional": true
                  },
                  "medicines": {
                    "type": "array",
                    "optional": true,
                    "items": {
                      "type": "object",
                      "properties": {
                        "medicine": {
                          "type": "string",
                          "format": "ObjectId"
                        },
                        "amount": {
                          "type": "integer"
                        },
                        "days": {
                          "type": "integer"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "pethealthcheck.success.create"
          },
          "422": {
            "description": "pethealthcheck.error.not-found or database.error.not-performed or pet.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/health-check/{id}": {
      "get": {
        "description": "Get health check by id",
        "tags": ["Health Check"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Health check id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "introducedBy": {
                        "type": "string"
                      },
                      "submissionDate": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "pet": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "breed": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "age": {
                        "type": "integer"
                      },
                      "weight": {
                        "type": "integer"
                      },
                      "visit": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "note": {
                        "type": "string"
                      },
                      "symptoms": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "ObjectId"
                        }
                      },
                      "diseases": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "ObjectId"
                        }
                      },
                      "medicines": {
                        "type": "array",
                        "items": {
                          "type": "object",
                          "properties": {
                            "medicine": {
                              "type": "string",
                              "format": "ObjectId"
                            },
                            "amount": {
                              "type": "integer"
                            },
                            "days": {
                              "type": "integer"
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "pethealthcheck.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "put": {
        "description": "Update health check by id",
        "tags": ["Health Check"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Health check id",
          "required": true,
          "type": "string",
          "format": "ObjectId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "weight": {
                    "type": "integer"
                  },
                  "note": {
                    "type": "string"
                  },
                  "symptoms": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "format": "ObjectId"
                    }
                  },
                  "diseases": {
                    "type": "array",
                    "items": {
                      "type": "string",
                      "format": "ObjectId"
                    }
                  },
                  "medicines": {
                    "type": "array",
                    "optional": true,
                    "items": {
                      "type": "object",
                      "properties": {
                        "medicine": {
                          "type": "string",
                          "format": "ObjectId"
                        },
                        "amount": {
                          "type": "integer"
                        },
                        "days": {
                          "type": "integer"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "pethealthcheck.success.delete"
          },
          "422": {
            "description": "pethealthcheck.error.not-found or access.denied or database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/health-public": {
      "get": {
        "description": "Get health check by token",
        "tags": ["Health Public"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "categoryLadders": {
                    "type": "array",
                    "items": {
                      "type": "object",
                      "properties": {
                        "token": {
                          "type": "string",
                          "format": "JWT"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "version": {
                        "type": "integer"
                      },
                      "introducedBy": {
                        "type": "string"
                      },
                      "submissionDate": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "pet": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "breed": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "age": {
                        "type": "integer"
                      },
                      "weight": {
                        "type": "integer"
                      },
                      "visit": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "note": {
                        "type": "array"
                      },
                      "symptoms": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "ObjectId"
                        }
                      },
                      "diseases": {
                        "type": "array",
                        "items": {
                          "type": "string",
                          "format": "ObjectId"
                        }
                      },
                      "medicines": {
                        "type": "array",
                        "items": {
                          "type": "object",
                          "properties": {
                            "medicine": {
                              "type": "string",
                              "format": "ObjectId"
                            },
                            "amount": {
                              "type": "integer"
                            },
                            "days": {
                              "type": "integer"
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "pethealthcheck.error.not-found or token.expired"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/health-public/": {
      "post": {
        "description": "Create health check by token",
        "tags": ["Health Public"],
        "produces": ["application/json"],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "items": {
                    "type": "object",
                    "properties": {
                      "token": {
                        "type": "string",
                        "format": "JWT"
                      },
                      "weight": {
                        "type": "integer"
                      },
                      "symptoms": {
                        "type": "array",
                        "optional": true,
                        "items": {
                          "type": "string",
                          "format": "ObjectId"
                        }
                      },
                      "diseases": {
                        "type": "array",
                        "optional": true,
                        "items": {
                          "type": "string",
                          "format": "ObjectId"
                        }
                      },
                      "note": {
                        "type": "string",
                        "optional": true
                      },
                      "medicines": {
                        "type": "array",
                        "optional": true,
                        "items": {
                          "type": "object",
                          "properties": {
                            "medicine": {
                              "type": "string",
                              "format": "ObjectId"
                            },
                            "amount": {
                              "type": "integer"
                            },
                            "days": {
                              "type": "integer"
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "pethealthcheck.success.create"
          },
          "422": {
            "description": "pethealthcheck.error.not-found or token.expired or database.error.not-performed"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/messages": {
      "get": {
        "description": "Get all messages",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "submissionDate": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "name": {
                        "type": "string"
                      },
                      "profileImage": {
                        "type": "string"
                      },
                      "friend": {
                        "type": "object",
                        "properties": {
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "message": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/messages/place": {
      "get": {
        "description": "Get all place messages",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "submissionDate": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "name": {
                        "type": "string"
                      },
                      "profileImage": {
                        "type": "string"
                      },
                      "friend": {
                        "type": "object",
                        "properties": {
                          "name": {
                            "type": "string"
                          },
                          "profileImage": {
                            "type": "string"
                          },
                          "_id": {
                            "type": "string",
                            "format": "ObjectId"
                          }
                        }
                      },
                      "message": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/messages/user/{id}": {
      "get": {
        "description": "Get all messages with user",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "User id - if chatUserId is true, then this is firebase id, otherwise it is chatUserId",
          "required": true,
          "type": "string",
          "format": "ObjectId or FirebaseId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "chatUserId": {
                    "type": "boolean",
                    "optional": true
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "submissionDate": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "chatUserId": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "text": {
                        "type": "string"
                      },
                      "attached": {
                        "type": "string"
                      },
                      "file": {
                        "type": "object",
                        "properties": {
                          "mime": {
                            "type": "string"
                          },
                          "url": {
                            "type": "string"
                          }
                        }
                      },
                      "seen": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "foreign": {
                        "type": "boolean"
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Post message to user",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "User id - if chatUserId is true, then this is firebase id, otherwise it is chatUserId",
          "required": true,
          "type": "string",
          "format": "ObjectId or FirebaseId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "text": {
                    "type": "string"
                  },
                  "image": {
                    "type": "string"
                  },
                  "chatUserId": {
                    "type": "boolean",
                    "optional": true
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "message.success.created"
          },
          "422": {
            "description": "user.error.not-found / access.denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/messages/to-place/{id}": {
      "post": {
        "description": "Post message to place employee",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "Place employee id - if chatUserId is true, then this is firebase id, otherwise it is chatUserId",
          "required": true,
          "type": "string",
          "format": "ObjectId or FirebaseId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "text": {
                    "type": "string"
                  },
                  "image": {
                    "type": "string"
                  },
                  "chatUserId": {
                    "type": "boolean",
                    "optional": true
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "message.success.created"
          },
          "422": {
            "description": "user.error.not-found / access.denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "get": {
        "description": "Get all messages with place employee",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "User id - if chatUserId is true, then this is firebase id, otherwise it is chatUserId",
          "required": true,
          "type": "string",
          "format": "ObjectId or FirebaseId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "chatUserId": {
                    "type": "boolean",
                    "optional": true
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "submissionDate": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "chatUserId": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "text": {
                        "type": "string"
                      },
                      "attached": {
                        "type": "string"
                      },
                      "file": {
                        "type": "object",
                        "properties": {
                          "mime": {
                            "type": "string"
                          },
                          "url": {
                            "type": "string"
                          }
                        }
                      },
                      "seen": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "foreign": {
                        "type": "boolean"
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/messages/from-place/{id}": {
      "get": {
        "description": "Get all messages from place employee",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "User id - if chatUserId is true, then this is firebase id, otherwise it is chatUserId",
          "required": true,
          "type": "string",
          "format": "ObjectId or FirebaseId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "chatUserId": {
                    "type": "boolean",
                    "optional": true
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Expected response to a valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "submissionDate": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "_id": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "chatUserId": {
                        "type": "string",
                        "format": "ObjectId"
                      },
                      "text": {
                        "type": "string"
                      },
                      "attached": {
                        "type": "string"
                      },
                      "file": {
                        "type": "object",
                        "properties": {
                          "mime": {
                            "type": "string"
                          },
                          "url": {
                            "type": "string"
                          }
                        }
                      },
                      "seen": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "foreign": {
                        "type": "boolean"
                      }
                    }
                  }
                }
              }
            }
          },
          "422": {
            "description": "user.error.not-found"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "description": "Post message from place employee to user",
        "tags": ["Messages"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "description": "User id - if chatUserId is true, then this is firebase id, otherwise it is chatUserId",
          "required": true,
          "type": "string",
          "format": "ObjectId or FirebaseId"
        }],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "text": {
                    "type": "string"
                  },
                  "image": {
                    "type": "string"
                  },
                  "chatUserId": {
                    "type": "boolean",
                    "optional": true
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "message.success.created"
          },
          "422": {
            "description": "user.error.not-found / access.denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/pets": {
      "get": {
        "description": "Get all pets for a user",
        "tags": ["User Pets"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string"
                      },
                      "name": {
                        "type": "string"
                      },
                      "breed": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          }
                        }
                      },
                      "weight": {
                        "type": "number"
                      },
                      "dateOfBirth": {
                        "type": "string",
                        "format": "date-time"
                      },
                      "profileImage": {
                        "type": "string"
                      },
                      "owner": {
                        "type": "string"
                      },
                      "diagnosedDiseases": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string"
                          },
                          "name": {
                            "type": "string"
                          },
                          "description": {
                            "type": "string"
                          },
                          "symptoms": {
                            "type": "string"
                          },
                          "treatment": {
                            "type": "string"
                          },
                          "breed": {
                            "type": "string"
                          }
                        }
                      },
                      "lastHealthCheck": {
                        "type": "object",
                        "properties": {
                          "_id": {
                            "type": "string"
                          },
                          "introducedBy": {
                            "type": "string"
                          },
                          "submissionDate": {
                            "type": "string",
                            "format": "date-time"
                          },
                          "pet": {
                            "type": "string"
                          },
                          "breed": {
                            "type": "string"
                          },
                          "age": {
                            "type": "number"
                          },
                          "weight": {
                            "type": "number"
                          },
                          "visit": {
                            "type": "string"
                          },
                          "note": {
                            "type": "string"
                          },
                          "symptoms": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "diseases": {
                            "type": "array",
                            "items": {
                              "type": "string"
                            }
                          },
                          "medicines": {
                            "type": "array",
                            "items": {
                              "type": "object",
                              "properties": {
                                "medicine": {
                                  "type": "string"
                                },
                                "days": {
                                  "type": "number"
                                },
                                "amount": {
                                  "type": "number"
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "post": {
        "summary": "Create a pet",
        "description": "Create a new pet for a user.",
        "tags": ["User Pets"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "ref": "#/components/schemas/PetInput"
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "Success. The pet has been created."
          },
          "401": {
            "description": "Unauthorized. User authentication is required."
          },
          "500": {
            "description": "Internal Server Error. An unexpected error occurred."
          }
        }
      }
    },
    "/user/pets/{id}": {
      "put": {
        "description": "Update a pet",
        "tags": ["User Pets"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Pet id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "breed": {
                    "type": "string"
                  },
                  "dateOfBirth": {
                    "type": "string",
                    "format": "date-time"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "pet.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/pets/{id}/image": {
      "put": {
        "description": "Add an image to a pet",
        "tags": ["User Pets"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Pet id"
        }],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": null,
              "  type": "object",
              "  properties": null,
              "    profileImage": null,
              "      type": "string"
            }
          }
        },
        "responses": {
          "200": {
            "description": "pet.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Delete an image from a pet",
        "tags": ["User Pets"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Pet id"
        }],
        "responses": {
          "200": {
            "description": "pet.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/pets/{id}/disease/{disease}": {
      "put": {
        "description": "Add a disease to a pet",
        "tags": ["User Pets"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Pet id"
        }, {
          "in": "path",
          "name": "disease",
          "required": true,
          "type": "string",
          "description": "Disease id"
        }],
        "responses": {
          "200": {
            "description": "pet.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Delete a disease from a pet",
        "tags": ["User Pets"],
        "produces": ["application/json"],
        "parameters": [{
          "in": "path",
          "name": "id",
          "required": true,
          "type": "string",
          "description": "Pet id"
        }, {
          "in": "path",
          "name": "disease",
          "required": true,
          "type": "string",
          "description": "Disease id"
        }],
        "responses": {
          "200": {
            "description": "pet.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/breeds": {
      "get": {
        "description": "Pobranie listy ras",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response for valid request",
            "content": {
              "appliaction/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "example": "5f9f7b9b9b9b9b9b9b9b9b9b"
                      },
                      "animal": {
                        "type": "string"
                      },
                      "group": {
                        "type": "string"
                      },
                      "groupNumber": {
                        "type": "integer"
                      },
                      "country": {
                        "type": "string"
                      },
                      "section": {
                        "type": "string"
                      },
                      "type": {
                        "type": "string"
                      },
                      "key": {
                        "type": "string"
                      },
                      "avatar": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "weight": {
                        "type": "object",
                        "properties": {
                          "from": {
                            "type": "integer"
                          },
                          "to": {
                            "type": "integer"
                          }
                        }
                      },
                      "dangerous": {
                        "type": "integer",
                        "min": 0,
                        "max": 10
                      },
                      "friendly": {
                        "type": "integer",
                        "min": 0,
                        "max": 10
                      },
                      "children": {
                        "type": "integer",
                        "min": 0,
                        "max": 10
                      },
                      "maintenance": {
                        "type": "integer",
                        "min": 0,
                        "max": 10
                      },
                      "training": {
                        "type": "integer",
                        "min": 0,
                        "max": 10
                      }
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/symptoms": {
      "get": {
        "description": "Pobranie listy symptomów",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response for valid request",
            "content": {
              "appliaction/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "example": "5f9f7b9b9b9b9b9b9b9b9b9b"
                      },
                      "name": {
                        "type": "string"
                      },
                      "affectedAnimals": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "code": {
                        "type": "string"
                      },
                      "probableDiseases": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/diseases": {
      "get": {
        "description": "Pobranie listy chorób",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response for valid request",
            "content": {
              "appliaction/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "example": "5f9f7b9b9b9b9b9b9b9b9b9b"
                      },
                      "name": {
                        "type": "string"
                      },
                      "affectedAnimals": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "code": {
                        "type": "string"
                      },
                      "severity": {
                        "type": "integer",
                        "min": 0,
                        "max": 10
                      },
                      "fatal": {
                        "type": "boolean"
                      },
                      "incurable": {
                        "type": "boolean"
                      },
                      "typicalRemedy": {
                        "type": "string"
                      },
                      "symptoms": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      },
                      "instructions": {
                        "type": "array",
                        "items": {
                          "type": "string"
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/medicines": {
      "get": {
        "description": "Pobranie listy medykamentów",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response for valid request",
            "content": {
              "appliaction/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "_id": {
                        "type": "string",
                        "example": "5f9f7b9b9b9b9b9b9b9b9b9b"
                      },
                      "name": {
                        "type": "string"
                      },
                      "description": {
                        "type": "string"
                      },
                      "code": {
                        "type": "string"
                      },
                      "producent": {
                        "type": "string"
                      },
                      "image": {
                        "type": "string"
                      }
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/create": {
      "post": {
        "description": "Utworzenie użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "location": {
                    "type": "array",
                    "items": null,
                    "  type": "number"
                  },
                  "pushPermission": {
                    "type": "boolean"
                  },
                  "gpsPermission": {
                    "type": "boolean"
                  },
                  "profileImage": {
                    "type": "string"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "user.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/permission": {
      "put": {
        "description": "Edycja permisji",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "pushPermission": {
                    "type": "boolean"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "permission.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/push": {
      "post": {
        "description": "Dodanie push tokena",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "pushToken": {
                    "type": "string"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "push.success.create"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Usunięcie push tokena",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "pushToken": {
                    "type": "string"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "push.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/profile": {
      "get": {
        "description": "Podgląd profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "Response for valid request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {
                    "_id": {
                      "type": "string"
                    },
                    "timezone": {
                      "type": "string",
                      "format": "date-time"
                    },
                    "name": {
                      "type": "string"
                    },
                    "bio": {
                      "type": "string"
                    },
                    "areaRadius": {
                      "type": "integer"
                    },
                    "profileImage": {
                      "type": "string"
                    },
                    "location": {
                      "type": "object",
                      "properties": {
                        "coordinates": {
                          "type": "array",
                          "items": {
                            "type": "number"
                          }
                        }
                      }
                    },
                    "phone": {
                      "type": "string"
                    },
                    "verified": {
                      "type": "boolean"
                    },
                    "pushTokens": {
                      "type": "array",
                      "items": {
                        "type": "object",
                        "properties": {
                          "token": {
                            "type": "string"
                          },
                          "expirationDate": {
                            "type": "string",
                            "format": "date-time"
                          }
                        }
                      }
                    },
                    "pushPermission": {
                      "type": "boolean"
                    },
                    "gpsPermission": {
                      "type": "boolean"
                    },
                    "pets": {
                      "type": "array",
                      "items": {
                        "type": "string"
                      }
                    },
                    "accountSubscription": {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string"
                        },
                        "expirationDate": {
                          "type": "string",
                          "format": "date-time"
                        }
                      }
                    },
                    "subscriptions": {
                      "type": "array",
                      "items": {
                        "type": "object",
                        "properties": {
                          "type": {
                            "type": "string"
                          },
                          "from": {
                            "type": "string",
                            "format": "date-time"
                          },
                          "to": {
                            "type": "string",
                            "format": "date-time"
                          },
                          "paymentMethod": {
                            "type": "string"
                          },
                          "transactionId": {
                            "type": "string"
                          },
                          "subscriptionId": {
                            "type": "string"
                          }
                        }
                      }
                    },
                    "cart": {
                      "type": "array",
                      "items": {
                        "type": "object",
                        "properties": {
                          "product": {
                            "type": "string"
                          },
                          "amount": {
                            "type": "number"
                          }
                        }
                      }
                    },
                    "businessSettings": {
                      "type": "object",
                      "properties": {
                        "accountOwner": {
                          "type": "string"
                        },
                        "accountAddress": {
                          "type": "string"
                        },
                        "accountNumber": {
                          "type": "string"
                        },
                        "accountBank": {
                          "type": "string"
                        }
                      }
                    },
                    "studioAccount": {
                      "type": "object",
                      "properties": {
                        "enabled": {
                          "type": "boolean"
                        }
                      }
                    },
                    "accountBlocs": {
                      "type": "object",
                      "properties": {
                        "type": {
                          "type": "string"
                        },
                        "hard": {
                          "type": "boolean"
                        },
                        "upTo": {
                          "type": "string",
                          "format": "date-time"
                        }
                      }
                    },
                    "publicSettings": {
                      "type": "object",
                      "properties": {
                        "name": {
                          "type": "string"
                        },
                        "surname": {
                          "type": "string"
                        },
                        "phone": {
                          "type": "string"
                        },
                        "email": {
                          "type": "string"
                        },
                        "bio": {
                          "type": "string"
                        },
                        "verified": {
                          "type": "boolean"
                        }
                      }
                    },
                    "specialist": {
                      "type": "object",
                      "properties": {
                        "enabled": {
                          "type": "boolean"
                        },
                        "types": {
                          "type": "array",
                          "items": {
                            "type": "string"
                          }
                        },
                        "clinic": {
                          "type": "string"
                        },
                        "allowedAnimals": {
                          "type": "array",
                          "items": {
                            "type": "string"
                          }
                        },
                        "forbiddenBreeds": {
                          "type": "array",
                          "items": {
                            "type": "string"
                          }
                        }
                      }
                    },
                    "careWorker": {
                      "type": "object",
                      "properties": {
                        "space": {
                          "type": "string"
                        },
                        "bio": {
                          "type": "string"
                        },
                        "currency": {
                          "type": "string"
                        },
                        "checkIn": {
                          "type": "object",
                          "properties": {
                            "minutes": {
                              "type": "number"
                            },
                            "hours": {
                              "type": "number"
                            }
                          }
                        },
                        "checkOut": {
                          "type": "object",
                          "properties": {
                            "minutes": {
                              "type": "number"
                            },
                            "hours": {
                              "type": "number"
                            }
                          }
                        },
                        "images": {
                          "type": "array",
                          "items": {
                            "type": "object",
                            "properties": {
                              "link": {
                                "type": "string"
                              }
                            }
                          }
                        },
                        "location": {
                          "type": "object",
                          "properties": {
                            "coordinates": {
                              "type": "array",
                              "items": {
                                "type": "number"
                              }
                            }
                          }
                        },
                        "radius": {
                          "type": "number"
                        },
                        "pickup": {
                          "type": "boolean"
                        },
                        "pricing": {
                          "type": "object",
                          "properties": {
                            "serviceName": {
                              "type": "string"
                            },
                            "service": {
                              "type": "string"
                            },
                            "animal": {
                              "type": "string"
                            },
                            "time": {
                              "type": "number"
                            },
                            "weights": {
                              "type": "array",
                              "items": {
                                "type": "object",
                                "properties": {
                                  "maxWeight": {
                                    "type": "number"
                                  },
                                  "price": {
                                    "type": "number"
                                  },
                                  "dynamicPricing": {
                                    "type": "array",
                                    "items": {
                                      "type": "object",
                                      "properties": {
                                        "day": {
                                          "type": "number"
                                        },
                                        "price": {
                                          "type": "number"
                                        },
                                        "from": {
                                          "type": "object",
                                          "properties": {
                                            "hours": {
                                              "type": "number"
                                            },
                                            "minutes": {
                                              "type": "number"
                                            }
                                          }
                                        },
                                        "to": {
                                          "type": "object",
                                          "properties": {
                                            "hours": {
                                              "type": "number"
                                            },
                                            "minutes": {
                                              "type": "number"
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        },
                        "paymentTypes": {
                          "type": "array",
                          "items": {
                            "type": "string"
                          }
                        },
                        "inquiredForVerification": {
                          "type": "string",
                          "format": "date-time"
                        },
                        "verified": {
                          "type": "string",
                          "format": "date-time"
                        },
                        "referrals": {
                          "type": "number"
                        },
                        "subscription": {
                          "type": "object",
                          "properties": null
                        },
                        "licenses": {
                          "type": "array",
                          "items": {
                            "type": "object",
                            "properties": {
                              "type": {
                                "type": "string"
                              },
                              "from": {
                                "type": "string",
                                "format": "date-time"
                              },
                              "to": {
                                "type": "string",
                                "format": "date-time"
                              },
                              "paymentMethod": {
                                "type": "string"
                              },
                              "trasactionId": {
                                "type": "string"
                              },
                              "subscriptionId": {
                                "type": "string"
                              }
                            }
                          }
                        },
                        "maxCareAnimals": {
                          "type": "number"
                        },
                        "maxKeepingAnimals": {
                          "type": "number"
                        },
                        "maxCollisionHomeVisit": {
                          "type": "number"
                        },
                        "minAnimalAge": {
                          "type": "number"
                        },
                        "allowedAnimals": {
                          "type": "array",
                          "items": {
                            "type": "string"
                          }
                        },
                        "forbiddenBreeds": {
                          "type": "array",
                          "items": {
                            "type": "string"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "put": {
        "description": "Edycja profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "areaRadius": {
                    "type": "integer"
                  },
                  "bio": {
                    "type": "string"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "userprofile.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/profile/public": {
      "put": {
        "description": "Edycja profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "name": {
                    "type": "string"
                  },
                  "surname": {
                    "type": "string"
                  },
                  "phone": {
                    "type": "string"
                  },
                  "email": {
                    "type": "string"
                  },
                  "bio": {
                    "type": "string"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "userpublicsettings.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Edycja profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "userpublicsettings.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/profile/location": {
      "put": {
        "description": "Edycja profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "location": {
                    "type": "array",
                    "size": 2,
                    "items": {
                      "type": "number"
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "userlocation.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    },
    "/user/profile/image": {
      "put": {
        "description": "Edycja profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "profileImage": {
                    "type": "string"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "userprofileimage.success.update"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      },
      "delete": {
        "description": "Edycja profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "userprofileimage.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        },
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "accountOwner": {
                    "type": "string"
                  },
                  "accountAddress": {
                    "type": "string"
                  },
                  "accountNumber": {
                    "type": "string"
                  },
                  "accountBank": {
                    "type": "string"
                  }
                }
              }
            }
          }
        }
      }
    },
    "/user/business": {
      "delete": {
        "description": "Edycja profilu użytkownika",
        "tags": ["User"],
        "produces": ["application/json"],
        "responses": {
          "200": {
            "description": "userbusinesssettings.success.delete"
          },
          "401": {
            "description": "Access Denied"
          },
          "500": {
            "description": "server.error.internal"
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "PostCoordinates": {
        "type": "object",
        "properties": {
          "x": {
            "type": "number"
          },
          "y": {
            "type": "number"
          },
          "height": {
            "type": "number"
          },
          "time": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "PostRoutePath": {
        "type": "object",
        "properties": {
          "points": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "location": {
                  "type": "object",
                  "properties": {
                    "coordinates": {
                      "type": "array",
                      "items": {
                        "type": "number"
                      }
                    }
                  }
                },
                "height": {
                  "type": "number"
                },
                "time": {
                  "type": "string",
                  "format": "date-time"
                }
              }
            }
          }
        }
      },
      "PostRouteCheckpoint": {
        "type": "object",
        "properties": {
          "x": {
            "type": "number"
          },
          "y": {
            "type": "number"
          },
          "name": {
            "type": "string"
          }
        }
      },
      "Disease": {
        "type": "object",
        "properties": {
          "affectedAnimals": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "name": {
            "type": "string"
          },
          "code": {
            "type": "string"
          },
          "severity": {
            "type": "number",
            "max": 10,
            "min": 0
          },
          "fatal": {
            "type": "boolean"
          },
          "incurable": {
            "type": "boolean"
          },
          "symptoms": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "typicalRemedy": {
            "type": "string"
          },
          "instructions": {
            "type": "array",
            "items": {
              "type": "string"
            }
          }
        }
      },
      "DiseaseInputBody": {
        "type": "object",
        "properties": {
          "affectedAnimals": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "name": {
            "type": "string"
          },
          "code": {
            "type": "string"
          },
          "severity": {
            "type": "number"
          },
          "fatal": {
            "type": "boolean"
          },
          "incurable": {
            "type": "boolean"
          },
          "typicalRemedy": {
            "type": "string"
          },
          "instructions": {
            "type": "array",
            "items": {
              "type": "string"
            }
          }
        }
      },
      "Medicine": {
        "type": "object",
        "properties": {
          "_id": {
            "type": "string"
          },
          "name": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "code": {
            "type": "string"
          },
          "producent": {
            "type": "string"
          },
          "image": {
            "type": "string"
          }
        }
      },
      "MedicineInputBody": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "code": {
            "type": "string"
          },
          "producent": {
            "type": "string"
          },
          "image": {
            "type": "string"
          }
        }
      },
      "Symptom": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string"
          },
          "code": {
            "type": "string"
          },
          "affectedAnimals": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "probableDiseases": {
            "type": "array",
            "items": {
              "type": "string"
            }
          }
        }
      },
      "PetInput": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string"
          },
          "breed": {
            "type": "string"
          },
          "weight": {
            "type": "number"
          },
          "diseases": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "dateOfBirth": {
            "type": "string",
            "format": "date-time"
          },
          "profileImage": {
            "type": "string"
          }
        }
      }
    }
  },
  "tags": []
};