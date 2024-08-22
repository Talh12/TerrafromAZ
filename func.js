const { BlobServiceClient } = require('@azure/storage-blob');

module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    const connectionString = process.env.AZURE_STORAGE_CONNECTION_STRING;
    const containerName = '$web';
    const blobName = 'index.html';

    const blobServiceClient = BlobServiceClient.fromConnectionString(connectionString);
    const containerClient = blobServiceClient.getContainerClient(containerName);
    const blobClient = containerClient.getBlobClient(blobName);
    
    try {
        const downloadBlockBlobResponse = await blobClient.download();
        const downloaded = await streamToText(downloadBlockBlobResponse.readableStreamBody);

        context.res = {
            status: 200,
            headers: {
                'Content-Type': 'text/html'
            },
            body: downloaded
        };
    } catch (error) {
        context.log.error('Error downloading blob:', error);
        context.res = {
            status: 500,
            body: 'Error retrieving blob content.'
        };
    }
};

async function streamToText(readableStream) {
    return new Promise((resolve, reject) => {
        let data = '';
        readableStream.on('data', chunk => data += chunk);
        readableStream.on('end', () => resolve(data));
        readableStream.on('error', reject);
    });
}
