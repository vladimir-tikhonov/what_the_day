const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    devtool: 'source-map',

    entry: './src/index.jsx',

    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js',
    },

    resolve: {
        alias: {
            styles: path.resolve(__dirname, 'src', 'styles'),
        },
        extensions: ['.js', '.jsx', '.scss'],
        modules: [path.resolve(__dirname, 'src'), 'node_modules'],
    },

    plugins: [
        new HtmlWebpackPlugin({
            filename: 'index.html',
            template: 'src/index.template.html',
        }),
    ],

    module: {
        loaders: [{
            test: /\.(js|jsx)$/,
            include: [
                path.resolve(__dirname, 'src'),
            ],
            loader: 'babel',
            query: {
                cacheDirectory: '/tmp/',
            },
        },
        {
            test: /\.scss$/,
            loaders: [
                'style?sourceMap',
                'css?modules&importLoaders=1&localIdentName=[path]___[name]__[local]___[hash:base64:5]',
                'sass',
            ],
        }],
    },

    devServer: {
        host: '0.0.0.0',
        port: 3000,
        inline: false,
        contentBase: path.resolve(__dirname, 'dist'),
        historyApiFallback: true,
    },
};
