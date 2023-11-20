# Kong-API-Access-Plugin-Sample

kong のプラグインから API を呼び出すサンプルになります  
ここでは`restriction-check`という upstream を呼び出す前に規制情報を API から取得し、その値に応じてレスポンスを返すプラグインを作成しています

詳しくは[Zenn の記事](https://zenn.dev/naoto_raimi/articles/443399837088a1)をご覧ください

## App Start

```
docker compose up -d --build
```

## Sample Request

```
curl -i -X POST -H "Content-Type: application/json" -d '{"test": "test"}' http://localhost:8000/httpbin/post

>>>
HTTP/1.1 503 Service Temporarily Unavailable
{
    "message": "This API is under maintenance."
}
```
